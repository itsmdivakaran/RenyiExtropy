#' Calculate Jensen-Shannon Divergence
#'
#' @param p Numeric vector. First probability distribution.
#' @param q Numeric vector. Second probability distribution. Same length as p.
#'
#' @return Numeric value. Jensen-Shannon divergence.
#'
#' @details
#' \deqn{JSD(P, Q) = \frac{1}{2} D_{KL}(P || M) + \frac{1}{2} D_{KL}(Q || M)}
#' where \eqn{M = (P+Q)/2}.
#'
#' @export
js_divergence <- function(p, q) {
  if (length(p) != length(q))
    stop("p and q must be the same length.")
  m <- 0.5 * (p + q)
  return(0.5 * kl_divergence(p, m) + 0.5 * kl_divergence(q, m))
}
