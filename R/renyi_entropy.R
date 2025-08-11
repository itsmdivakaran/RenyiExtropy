#' Rényi Entropy
#'
#' Computes the Rényi entropy for a discrete probability distribution and order parameter \eqn{q}.
#'
#' @param p Numeric probability vector \eqn{\mathbf{p} = (p_1, \ldots, p_n)},
#' where each element is in \eqn{[0, 1]} and \eqn{\sum_{i=1}^n p_i = 1}.
#' @param q Numeric scalar. The Rényi parameter (must satisfy \eqn{q > 0} and \eqn{q \neq 1}).
#'
#' @return A numeric scalar giving the Rényi entropy value.
#'
#' @details
#' The Rényi entropy is defined as:
#' \deqn{
#'   H_q(\mathbf{p}) = \frac{1}{1 - q} \log\left( \sum_{i=1}^n p_i^q \right)
#' }
#' For \eqn{q \to 1}, this reduces to the Shannon entropy:
#' \deqn{
#'   H(\mathbf{p}) = -\sum_{i=1}^n p_i \log p_i
#' }
#'
#' The function automatically detects if \eqn{q} is numerically close to 1 and
#' returns the Shannon entropy in that case.
#'
#' @examples
#' # Example probability vector
#' p <- c(0.2, 0.5, 0.3)
#'
#' # Compute Rényi entropy for q = 2
#' renyi_entropy(p, 2)
#'
#' # Compute for q = 0.5
#' renyi_entropy(p, 0.5)
#'
#' # Shannon entropy limit (q near 1)
#' renyi_entropy(p, 1.000001)
#'
#' @seealso \code{\link{shannon_entropy}}, \code{\link{renyi_extropy}}, \code{\link{extropy}}
#' @export
renyi_entropy <- function(p, q) {
  if (!is.numeric(p) || length(p) < 2 || any(p < 0) || any(p > 1) || abs(sum(p) - 1) > 1e-8)
    stop("p must be a probability vector (values in [0,1] summing to 1).")
  if (!is.numeric(q) || length(q) != 1 || q <= 0)
    stop("q must be a single positive number.")

  if (abs(q - 1) < 1e-8) {
    # Shannon entropy case
    p_nonzero <- p[p > 0]
    -sum(p_nonzero * log(p_nonzero))
  } else {
    (1 / (1 - q)) * log(sum(p^q))
  }
}
