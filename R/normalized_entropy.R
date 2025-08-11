#' Calculate Normalized Entropy
#'
#' @param p Numeric vector. Probability vector.
#'
#' @return Numeric value. Normalized Shannon entropy in \eqn{[0, 1]}.
#'
#' @export
normalized_entropy <- function(p) {
  n <- length(p)
  return(shannon_entropy(p) / log(n))
}
