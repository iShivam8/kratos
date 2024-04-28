(define-trait swap-trait
  (
    ;; Transfer from the caller to a new principal
    (transfer (uint principal principal (optional (buff 34))) (response bool uint))

    ;; Human readable name of the token
    (get-name () (response (string-ascii 32) uint))

    ;; Ticker symbol, or empty if none
    (get-symbol () (response (string-ascii 32) uint))

    ;; The number of decimals used, e.g. 6 would mean 1_000_000 represents 1 token
    (get-decimals () (response uint uint))

    ;; The balance of the passed principal
    (get-balance (principal) (response uint uint))

    ;; The current total supply (which does not need to be a constant)
    (get-total-supply () (response uint uint))

    ;; An optional URI that represents metadata of this token
    (get-token-uri () (response (optional (string-utf8 256)) uint))

    ;; Additional functions ;;

    ;; Mint function only kratos swap contract can call
    (mint (principal uint) (response bool uint))

    ;; Burn function only kratos swap contract can call
    (burn (principal uint) (response bool uint))

    ;; Keep the data as per principal
    (get-data (principal) (response {
      name: (string-ascii 32),
      symbol: (string-ascii 32),
      decimals: uint,
      uri: (optional (string-utf8 256)),
      supply: uint,
      balance: uint,
    } uint))
  )
)
