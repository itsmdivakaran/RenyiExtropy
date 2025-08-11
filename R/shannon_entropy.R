#' Shannon Entropy
#'
#' Computes the Shannon entropy for a discrete probability distribution.
#'
#' @param p Numeric probability vector \eqn{\mathbf{p} = (p_1, \ldots, p_n)},
#' where each element is in \eqn{[0, 1]} and \eqn{\sum_{i=1}^n p_i = 1}.
#'
#' @return A numeric scalar giving the Shannon entropy.
#'
#' @details
#' The Shannon entropy is defined as:
#' \deqn{
#'   H(\mathbf{p}) = - \sum_{i=1}^n p_i \log(p_i)
#' }
#' with the convention that terms where \eqn{p_i = 0} contribute 0.
#' This is the limit of the Rényi entropy as \eqn{q \to 1}.
#'
#' @examples
#' p <- c(0.2, 0.5, 0.3)
#'
#' # Compute Shannon entropy
#' shannon_entropy(p)
#'
#' @seealso \code{\link{renyi_entropy}}, \code{\link{extropy}}, \code{\link{renyi_extropy}}
#' @export
shannon_entropy <- function(p) {
  if (!is.numeric(p) || length(p) < 2 || any(p < 0) || any(p > 1) ||
      abs(sum(p) - 1) > 1e-8)
    stop("p must be a probability vector (values in [0,1] summing to 1).")

  p_nonzero <- p[p > 0]  # avoid log(0)
  -sum(p_nonzero * log(p_nonzero))
}
