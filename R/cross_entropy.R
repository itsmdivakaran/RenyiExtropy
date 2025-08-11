#' Calculate Cross-Entropy
#'
#' @param p Numeric vector. True probability distribution.
#' @param q Numeric vector. Estimated probability distribution. Same length as p.
#'
#' @return Numeric value. Cross-entropy H(P, Q).
#'
#' @details
#' Cross-entropy: \eqn{H(P,Q) = -\sum p_i \log q_i}.
#'
#' @export
cross_entropy <- function(p, q) {
  if (length(p) != length(q))
    stop("p and q must be the same length.")
  if (any(p < 0) || any(p > 1) || abs(sum(p) - 1) > 1e-8 ||
      any(q < 0) || any(q > 1) || abs(sum(q) - 1) > 1e-8)
    stop("p and q must be valid probability vectors.")
  q_nonzero <- q
  q_nonzero[q_nonzero == 0] <- 1e-15 # avoid log(0)
  return(-sum(p * log(q_nonzero)))
}

