#' Maximum Rényi Extropy for a Uniform Distribution
#'
#' Computes the maximum Rényi extropy, which occurs for a uniform discrete distribution.
#' This maximum depends only on the number of outcomes \eqn{n} and is independent of the
#' Rényi parameter \eqn{q}.
#'
#' @param n An integer scalar giving the number of outcomes in the discrete distribution.
#' Must satisfy \eqn{n \ge 2}.
#'
#' @return A numeric scalar giving the maximum Rényi extropy.
#'
#' @details
#' For a uniform distribution \eqn{p_i = 1/n}, the maximum Rényi extropy is:
#' \deqn{
#'   \max J_q(P) = (n - 1) \log\!\left(\frac{n}{n - 1}\right)
#' }
#' This holds for any \eqn{q > 0}, \eqn{q \neq 1}.
#'
#' @examples
#' # For 3 equally likely outcomes
#' max_renyi_extropy(3)
#'
#' # For a uniform distribution with 10 outcomes
#' max_renyi_extropy(10)
#'
#' @seealso [renyi_extropy()], [conditional_renyi_extropy()]
#' @export
max_renyi_extropy <- function(n) {
  if (!is.numeric(n) || length(n) != 1 || n < 2 || abs(n - round(n)) > 1e-8)
    stop("n must be a single integer >= 2")

  return((n - 1) * log(n / (n - 1)))
}
