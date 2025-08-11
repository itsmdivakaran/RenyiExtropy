#' Calculate KL Divergence
#'
#' @param p Numeric vector. True probability distribution.
#' @param q Numeric vector. Estimated probability distribution. Same length as p.
#'
#' @return Numeric value. KL divergence D_KL(P || Q).
#'
#' @details
#' \deqn{D_{KL}(P||Q) = \sum p_i \log (p_i / q_i)}
#'
#' @export
kl_divergence <- function(p, q) {
  if (length(p) != length(q))
    stop("p and q must be the same length.")
  if (any(p < 0) || any(p > 1) || abs(sum(p) - 1) > 1e-8 ||
      any(q < 0) || any(q > 1) || abs(sum(q) - 1) > 1e-8)
    stop("p and q must be valid probability vectors.")
  mask <- p > 0
  q_masked <- q[mask]
  q_masked[q_masked == 0] <- 1e-15
  return(sum(p[mask] * log(p[mask] / q_masked)))
}
