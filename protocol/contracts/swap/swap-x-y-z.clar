(use-trait ft-trait .sip-010-trait-ft-standard.sip-010-trait)

(define-constant ERR-SWAP-ONE-FAILED u1001)
(define-constant ERR-SWAP-TWO-FAILED u1002)

;; Swap X for Z with token Y in between
;; For instance, if we want to swap KLPT to gKRT but there is no KLPT/gKRT pair
;; We swap KLPT to USDA and USDA to gKRT
(define-public (swap-x-for-z
  (token-x-trait <ft-trait>)
  (token-y-trait <ft-trait>)
  (token-z-trait <ft-trait>)
  (dx uint)
  (min-dz uint)
  (inverse-first bool)
  (inverse-second bool)
)
  (let (
    (swapped-amounts (if inverse-first
      (unwrap! (contract-call? .swap swap-y-for-x token-x-trait token-y-trait dx u0) (err ERR-SWAP-ONE-FAILED))
      (unwrap! (contract-call? .swap swap-x-for-y token-x-trait token-y-trait dx u0) (err ERR-SWAP-ONE-FAILED))
    ))
    (y-amount (if inverse-first
      (unwrap-panic (element-at swapped-amounts u0))
      (unwrap-panic (element-at swapped-amounts u1))
    ))
    (swapped-amounts-2 (if inverse-second
      (unwrap! (contract-call? .swap swap-y-for-x token-z-trait token-y-trait y-amount min-dz) (err ERR-SWAP-TWO-FAILED))
      (unwrap! (contract-call? .swap swap-x-for-y token-y-trait token-z-trait y-amount min-dz) (err ERR-SWAP-TWO-FAILED))
    ))
    (z-amount (if inverse-second
      (unwrap-panic (element-at swapped-amounts-2 u0))
      (unwrap-panic (element-at swapped-amounts-2 u1))
    ))
  )
    (ok swapped-amounts-2)
  )
)
