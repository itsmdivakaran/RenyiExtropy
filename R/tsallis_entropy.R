#' Calculate the Tsallis Entropy
#'
#' Computes the Tsallis entropy for a given probability vector and order \eqn{q}.
#'
#' @param p Numeric vector. Probability vector. Elements must be between \eqn{0} and \eqn{1}
#'   (inclusive) and sum to \eqn{1}.
#' @param q Numeric scalar. Tsallis parameter (\eqn{q > 0}, \eqn{q \neq 1}).
#'
#' @return Numeric value. The Tsallis entropy.
#'
#' @details
#' The Tsallis entropy is defined as:
#' \deqn{
#'   H_q^{(T)}(P) = \frac{1 - \sum_i p_i^q}{q - 1}
#' }
#' For \eqn{q \to 1}, this reduces to the Shannon entropy.
#'
#' @examples
#' p <- c(0.2, 0.5, 0.3)
#' tsallis_entropy(p, 2)
#'
#' @seealso [shannon_entropy()], [renyi_entropy()]
#' @export
tsallis_entropy <- function(p, q) {
  if (any(p < 0) || any(p > 1) || abs(sum(p) - 1) > 1e-8)
    stop("Input must be a valid probability vector.")
  if (q <= 0)
    stop("Tsallis parameter q must be positive.")
  if (abs(q - 1) < 1e-8) {
    return(shannon_entropy(p))
  }
  return((1 - sum(p^q)) / (q - 1))
}
