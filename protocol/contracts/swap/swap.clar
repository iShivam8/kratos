(use-trait ft-trait .sip-010-trait-ft-standard.sip-010-trait)
;;(use-trait swap-token .swap-trait.swap-trait)

(define-constant transfer-x-failed-err (err u11))
(define-constant transfer-y-failed-err (err u12))
(define-constant pair-already-exists-err (err u13))

(define-constant INVALID-PAIR-ERR (err u21))
(define-constant ERR-INVALID-LIQUIDITY u22)
(define-constant ERR-WRONG-SWAP-TOKEN u23)

(define-data-var pair-count uint u0)

(define-map pairs-map
  { pair-id: uint }
  {
    token-x: principal,
    token-y: principal,
  }
)

(define-map pairs-data-map
  {
    token-x: principal,
    token-y: principal,
  }
  {
    enabled: bool,
    shares-total: uint,
    balance-x: uint,
    balance-y: uint,
    fee-balance-x: uint,
    fee-balance-y: uint,
    fee-to-address: (optional principal),
    swap-token: principal,
    name: (string-ascii 32),
  }
)

(define-read-only (get-name (token-x-trait <ft-trait>) (token-y-trait <ft-trait>))
  (let
    (
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (pair (unwrap! (map-get? pairs-data-map { token-x: token-x, token-y: token-y }) (err INVALID-PAIR-ERR)))
    )
    (ok (get name pair))
  )
)

(define-read-only (get-total-supply (token-x-trait <ft-trait>) (token-y-trait <ft-trait>))
  (let
    (
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (pair (unwrap! (map-get? pairs-data-map { token-x: token-x, token-y: token-y }) (err INVALID-PAIR-ERR)))
    )
    (ok (get shares-total pair))
  )
)

(define-read-only (get-shares (token-x principal) (token-y principal))
  (ok (get shares-total (unwrap! (map-get? pairs-data-map { token-x: token-x, token-y: token-y }) (err INVALID-PAIR-ERR))))
)

(define-public (get-balances (token-x-trait <ft-trait>) (token-y-trait <ft-trait>))
  (let
    (
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (pair (unwrap! (map-get? pairs-data-map { token-x: token-x, token-y: token-y }) (err INVALID-PAIR-ERR)))
    )
    (ok (list (get balance-x pair) (get balance-y pair)))
  )
)

(define-read-only (get-pair-details (token-x principal) (token-y principal))
  (let (
    (pair (map-get? pairs-data-map { token-x: token-x, token-y: token-y }))
  )
    (if (is-some pair)
      (ok pair)
      (err INVALID-PAIR-ERR)
    )
  )
)

;; @desc exchange known dx of x-token for at least min-dy of y-token based on current liquidity
;; @param token-x-trait; first token of pair
;; @param token-y-trait; second token of pair
;; @param dx; amount to swap for y-token
;; @param min-dy; swap will not happen if can't get at least min-dy back
;; @post list; amount of x-token and amount of received y-token
;; #[allow(unchecked_data)]
(define-public (swap-x-for-y (token-x-trait <ft-trait>) (token-y-trait <ft-trait>) (dx uint) (min-dy uint))
  (let (
    (token-x (contract-of token-x-trait))
    (token-y (contract-of token-y-trait))
    (pair (unwrap-panic (map-get? pairs-data-map { token-x: token-x, token-y: token-y })))
    (balance-x (get balance-x pair))
    (balance-y (get balance-y pair))
    (sender tx-sender)
    (dx-with-fees (/ (* u997 dx) u1000)) ;; 0.3% fee for LPs
    (dy (/ (* balance-y dx-with-fees) (+ balance-x dx-with-fees)))
    (fee (/ (* u5 dx) u10000)) ;; 0.05% fee for protocol
    (pair-updated
      (merge pair
        {
          balance-x: (+ balance-x dx),
          balance-y: (- balance-y dy),
          fee-balance-x: (if (is-some (get fee-to-address pair))
            (+ fee (get fee-balance-x pair))
            (get fee-balance-x pair)
          )
        }
      )
    )
  )

    (asserts! (is-ok (contract-call? token-x-trait transfer dx tx-sender (as-contract tx-sender) none)) transfer-x-failed-err)
    (try! (as-contract (contract-call? token-y-trait transfer dy tx-sender sender none)))

    (map-set pairs-data-map { token-x: token-x, token-y: token-y } pair-updated)
    (print { object: "pair", action: "swap-x-for-y", data: pair-updated })
    (ok (list dx dy))
  )
)

;; @desc exchange known dy of y-token for at least min-dx of x-token based on current liquidity
;; @param token-x-trait; first token of pair
;; @param token-y-trait; second token of pair
;; @param dy; amount to swap for y-token
;; @param min-dx; swap will not happen if can't get at least min-dx back
;; @post list; amount of x-token received and amount of y-token as input
(define-public (swap-y-for-x (token-x-trait <ft-trait>) (token-y-trait <ft-trait>) (dy uint) (min-dx uint))
  (let (
    (token-x (contract-of token-x-trait))
    (token-y (contract-of token-y-trait))
    (pair (unwrap-panic (map-get? pairs-data-map { token-x: token-x, token-y: token-y })))
    (balance-x (get balance-x pair))
    (balance-y (get balance-y pair))
    (sender tx-sender)
    (dy-with-fees (/ (* u997 dy) u1000)) ;; 0.3% fee for LPs
    (dx (/ (* balance-x dy-with-fees) (+ balance-y dy-with-fees)))
    (fee (/ (* u5 dy) u10000)) ;; 0.05% fee for protocol
    (pair-updated (merge pair {
      balance-x: (- balance-x dx),
      balance-y: (+ balance-y dy),
      fee-balance-y: (if (is-some (get fee-to-address pair))
        (+ fee (get fee-balance-y pair))
        (get fee-balance-y pair)
      )
    }))
  )

    (asserts! (is-ok (as-contract (contract-call? token-x-trait transfer dx tx-sender sender none))) transfer-x-failed-err)
    (asserts! (is-ok (contract-call? token-y-trait transfer dy tx-sender (as-contract tx-sender) none)) transfer-y-failed-err)

    (map-set pairs-data-map { token-x: token-x, token-y: token-y } pair-updated)
    (print { object: "pair", action: "swap-y-for-x", data: pair-updated })
    (ok (list dx dy))
  )
)

;; Creating pairs for liquidity pool

;; @desc create a new pair
;; @param token-x-trait; first token of pair
;; @param token-y-trait; second token of pair
;; @param swap-token-trait; LP token
;; @param pair-name; name for the new pair
;; @param x; amount to add to first token of pair
;; @param y; amount to add to second token of pair
;; @post boolean; returns true if pair created
;; #[allow(unchecked_data)]
(define-public (create-pair
  (token-x-trait <ft-trait>)
  (token-y-trait <ft-trait>)
  (swap-token-trait <ft-trait>)
  (pair-name (string-ascii 32))
  (x uint)
  (y uint)
)
  (let
    (
      (name-x (unwrap-panic (contract-call? token-x-trait get-name)))
      (name-y (unwrap-panic (contract-call? token-y-trait get-name)))
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (pair-id (+ (var-get pair-count) u1))
      (pair-data {
        enabled: true,
        shares-total: u0,
        balance-x: u0,
        balance-y: u0,
        fee-balance-x: u0,
        fee-balance-y: u0,
        fee-to-address: none,
        swap-token: (contract-of swap-token-trait),
        name: pair-name,
      })
    )
    (asserts!
      (and
        (is-none (map-get? pairs-data-map { token-x: token-x, token-y: token-y }))
        (is-none (map-get? pairs-data-map { token-x: token-y, token-y: token-x }))
      )
      pair-already-exists-err
    )
    ;;(try! (register-swap-token (contract-of swap-token-trait)))

    (map-set pairs-data-map { token-x: token-x, token-y: token-y } pair-data)
    (map-set pairs-map { pair-id: pair-id } { token-x: token-x, token-y: token-y })
    (var-set pair-count pair-id)
    (try! (add-to-liquidity token-x-trait token-y-trait swap-token-trait x y))
    (print { object: "pair", action: "created", data: pair-data })
    (ok true)
  )
)

;; @desc add liquidity to a pair
;; @param token-x-trait; first token of pair
;; @param token-y-trait; second token of pair
;; @param swap-token-trait; LP token
;; @param x; amount to add to first token of pair
;; @param y; amount to add to second token of pair, only used when pair is created
;; @post boolean; returns true if liquidity added
(define-public (add-to-liquidity (token-x-trait <ft-trait>) (token-y-trait <ft-trait>) (swap-token-trait <ft-trait>) (x uint) (y uint))
  (let
    (
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (pair (unwrap-panic (map-get? pairs-data-map { token-x: token-x, token-y: token-y })))
      (contract-address (as-contract tx-sender))
      (recipient-address tx-sender)
      (balance-x (get balance-x pair))
      (balance-y (get balance-y pair))
      (token (get swap-token pair))
      (new-shares
        (if (is-eq (get shares-total pair) u0)
          (sqrti (* x y))
          (/ (* x (get shares-total pair)) balance-x)
        )
      )
      (new-y
        (if (is-eq (get shares-total pair) u0)
          y
          (/ (* x balance-y) balance-x)
        )
      )
      (pair-updated (merge pair {
        shares-total: (+ new-shares (get shares-total pair)),
        balance-x: (+ balance-x x),
        balance-y: (+ balance-y new-y)
      }))
    )

    (asserts! (and (> x u0) (> new-y u0)) (err ERR-INVALID-LIQUIDITY))
    (asserts! (is-eq token (contract-of swap-token-trait)) (err ERR-WRONG-SWAP-TOKEN))

    (asserts! (is-ok (contract-call? token-x-trait transfer x tx-sender contract-address none)) transfer-x-failed-err)
    (asserts! (is-ok (contract-call? token-y-trait transfer new-y tx-sender contract-address none)) transfer-y-failed-err)

    (map-set pairs-data-map { token-x: token-x, token-y: token-y } pair-updated)

    (try! (contract-call? .token-klpt mint new-shares recipient-address))
    
    (print { object: "pair", action: "liquidity-added", data: pair-updated })
    (ok true)
  )
)