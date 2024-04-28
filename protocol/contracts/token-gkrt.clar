;; This contract implements the SIP-010 community-standard Fungible Token trait.
(impl-trait .sip-010-trait-ft-standard.sip-010-trait)
;;(impl-trait .kratos-governance-token-trait.governance-token-trait)

;; Define the FT, with no maximum supply
(define-fungible-token kratos-governance-token)

;; Define errors
(define-constant ERR_OWNER_ONLY (err u100))
(define-constant ERR_NOT_TOKEN_OWNER (err u101))
(define-constant ERR_NOT_AUTHORIZED u403)

;; Define constants for contract
(define-constant CONTRACT_OWNER tx-sender)
(define-constant TOKEN_URI u"gKRT is world's First Governance token on a Liquidity Provider Aggregator DeFi dApp on Bitcoin") ;; utf-8 string with token metadata host
(define-constant TOKEN_NAME "Kratos Governance Token")
(define-constant TOKEN_SYMBOL "gKRT")
(define-constant TOKEN_DECIMALS u6) ;; 6 units displayed past decimal, e.g. 1.000_000 = 1 token


;; SIP-010 function: Get the token balance of a specified principal
(define-read-only (get-balance (account principal))
  (ok (ft-get-balance kratos-governance-token account))
)

;; SIP-010 function: Returns the total supply of fungible token
(define-read-only (get-total-supply)
  (ok (ft-get-supply kratos-governance-token))
)

;; SIP-010 function: Returns the human-readable token name
(define-read-only (get-name)
  (ok TOKEN_NAME)
)

;; SIP-010 function: Returns the symbol or "ticker" for this token
(define-read-only (get-symbol)
  (ok TOKEN_SYMBOL)
)

;; SIP-010 function: Returns number of decimals to display
(define-read-only (get-decimals)
  (ok TOKEN_DECIMALS)
)

;; SIP-010 function: Returns the URI containing token metadata
(define-read-only (get-token-uri)
  (ok (some TOKEN_URI))
)

;; Mint new tokens and send them to a recipient.
;; Only the contract deployer can perform this operation.
(define-public (mint (amount uint) (recipient principal))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_OWNER_ONLY)
    (ft-mint? kratos-governance-token amount recipient)
  )
)

;; Calculate the governing power ratio as per the gKRT
;;(define-read-only (governing-power-ratio (account principal))
;;  (let (
;;       (total-supply (get-total-supply))
;;       (user-balance (get-balance account))
;;     )
;;     (if (> total-supply 0)
;;       (err "gKRT Total Supply is Zero")
;;       (ok (/ user-balance total-supply))
;;     )
;;   )
;;)

;; SIP-010 function: Transfers tokens to a recipient
;; Sender must be the same as the caller to prevent principals from transferring tokens they do not own.
(define-public (transfer
  (amount uint)
  (sender principal)
  (recipient principal)
  (memo (optional (buff 34)))
)
  (begin
    (asserts! (is-eq tx-sender sender) ERR_NOT_TOKEN_OWNER)
    (try! (ft-transfer? kratos-governance-token amount sender recipient))
    (match memo to-print (print to-print) 0x)
    (ok true)
  )
)

;; Burn method for Kratos DAO
(define-public (burn (amount uint) (sender principal))
  (begin
    ;;(asserts! (is-eq contract-caller .kratos-governance) (err ERR_NOT_TOKEN_OWNER))
    (ft-burn? kratos-governance-token amount sender)
  )
)
