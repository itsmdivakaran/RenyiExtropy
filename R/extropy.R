#' Classical Extropy
#'
#' Computes the classical extropy for a discrete probability distribution.
#'
#' @param p A numeric probability vector \eqn{\mathbf{p} = (p_1, \ldots, p_n)},
#' where each element is in \eqn{[0, 1]} and \eqn{\sum_{i=1}^n p_i = 1}.
#'
#' @return A numeric scalar giving the classical extropy.
#'
#' @details
#' The classical extropy is defined as:
#' \deqn{
#'   J(\mathbf{p}) = -\sum_{i=1}^n (1 - p_i) \log(1 - p_i)
#' }
#' Terms where \eqn{1 - p_i = 0} are omitted to avoid \eqn{\log 0}.
#'
#' @examples
#' p <- c(0.2, 0.5, 0.3)
#' extropy(p)
#'
#' extropy(rep(0.25, 4))
#'
#' @seealso \code{\link{renyi_extropy}}, \code{\link{shannon_entropy}}
#' @export
extropy <- function(p) {
  if (any(p < 0) || any(p > 1) || abs(sum(p) - 1) > 1e-8)
    stop("Input must be a valid probability vector (elements in [0,1], sum to 1).")

  comp <- 1 - p
  valid <- comp > 0
  -sum(comp[valid] * log(comp[valid]))
}
