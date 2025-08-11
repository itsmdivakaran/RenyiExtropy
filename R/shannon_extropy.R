#' Calculate the Shannon Extropy
#'
#' Computes the Shannon extropy for a given probability vector.
#'
#' @param p Numeric vector. Probability vector. Elements must be in \eqn{[0, 1]} and sum to 1.
#'
#' @return Numeric value. The Shannon extropy of the provided vector.
#'
#' @details
#' Shannon extropy is defined as \eqn{J(P) = -\sum_{i=1}^n (1 - p_i) \log(1 - p_i)}.
#' If a probability \eqn{p_i = 1}, the term is treated as 0.
#'
#' @examples
#' p <- c(0.2, 0.5, 0.3)
#' shannon_extropy(p)
#'
#' @seealso \code{\link{shannon_entropy}}, \code{\link{renyi_extropy}}
#' @export
shannon_extropy <- function(p) {
  if (any(p < 0) || any(p > 1) || abs(sum(p) - 1) > 1e-8)
    stop("Input must be a valid probability vector.")
  p_nonone <- p[p < 1]
  return(-sum((1 - p_nonone) * log(1 - p_nonone)))
}

