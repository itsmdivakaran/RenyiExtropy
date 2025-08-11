#' Calculate the Rényi Extropy
#'
#' Computes the Rényi extropy for a given probability vector and Rényi parameter.
#'
#' @param p Numeric vector. Probability vector. Elements must be in \[0, 1\] and sum to 1.
#' @param q Numeric scalar. Rényi parameter. Real number, not equal to 1.
#'
#' @return Numeric value. The calculated Rényi extropy.
#'
#' @details
#' The Rényi extropy of order \eqn{q} is defined as:
#' \deqn{J_q(P) = \frac{-(n-1)\log(n-1) + (n-1)\log\left( \sum_{i=1}^n (1 - p_i)^q \right)}{1 - q}}
#' where \eqn{n} is the number of elements in \eqn{P}.
#'
#' For \eqn{q \to 1}, the function returns the Shannon extropy:
#' \deqn{J(P) = -\sum_{i=1}^n (1 - p_i) \log(1 - p_i)}.
#'
#' For \eqn{n = 2}, Rényi extropy equals Rényi entropy.
#'
#' Throws an error if \code{p} is not a valid probability vector or if \code{q} is not a real number.
#'
#' @examples
#' p <- c(0.2, 0.5, 0.3)
#' renyi_extropy(p, 2)
#' renyi_extropy(p, 1.1)
#'
#' @seealso \code{\link{shannon_entropy}}, \code{\link{renyi_entropy}}, \code{\link{extropy}}
#' @export
renyi_extropy <- function(p, q) {
  if (!is.numeric(p) || length(p) < 2 || any(p < 0) || any(p > 1) || abs(sum(p) - 1) > 1e-8)
    stop("p must be a probability vector (values in [0,1] summing to 1).")
  if (!is.numeric(q) || length(q) != 1 || q <= 0)
    stop("q must be a single positive number.")

  n <- length(p)

  if (abs(q - 1) < 1e-8) {
    # Extropy as q → 1
    p_nonzero <- p[p < 1]  # avoid log(0)
    return(-sum((1 - p_nonzero) * log(1 - p_nonzero)))
  } else {
    return((-(n - 1) * log(n - 1) + (n - 1) * log(sum((1 - p)^q))) / (1 - q))
  }
}
