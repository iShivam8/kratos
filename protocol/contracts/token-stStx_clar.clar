(impl-trait .sip-010-trait-ft-standard.sip-010-trait)

(define-fungible-token stStx-token)

;; Define errors
(define-constant ERR_OWNER_ONLY (err u100))
(define-constant ERR_NOT_TOKEN_OWNER (err u101))
(define-constant ERR_NOT_AUTHORIZED u403)

;; Define constants for contract
(define-constant CONTRACT_OWNER tx-sender)
(define-constant TOKEN_URI u"stSTX") ;; utf-8 string with token metadata host
(define-constant TOKEN_NAME "Stacked STX Token")
(define-constant TOKEN_SYMBOL "stSTX")
(define-constant TOKEN_DECIMALS u6) ;; 6 units displayed past decimal, e.g. 1.000_000 = 1 token


(define-read-only (get-balance (who principal))
  (ok (ft-get-balance stStx-token who))
)

(define-read-only (get-total-supply)
  (ok (ft-get-supply stStx-token))
)

(define-read-only (get-name)
  (ok TOKEN_NAME)
)

(define-read-only (get-symbol)
  (ok TOKEN_SYMBOL)
)

(define-read-only (get-decimals)
  (ok TOKEN_DECIMALS)
)

(define-read-only (get-token-uri)
  (ok (some TOKEN_URI))
)

(define-public (mint (amount uint) (recipient principal))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_OWNER_ONLY)
    (ft-mint? stStx-token amount recipient)
  )
)

(define-public (transfer
  (amount uint)
  (sender principal)
  (recipient principal)
  (memo (optional (buff 34)))
)
  (begin
    (asserts! (is-eq tx-sender sender) ERR_NOT_TOKEN_OWNER)
    (try! (ft-transfer? stStx-token amount sender recipient))
    (match memo to-print (print to-print) 0x)
    (ok true)
  )
)

;; Burn method for stSTX DAO
(define-public (burn (amount uint) (sender principal))
  (begin
    (ft-burn? stStx-token amount sender)
  )
)
