#' Conditional Rényi Extropy
#'
#' Computes the conditional Rényi extropy \eqn{J_q(Y \mid X)} for two discrete random variables,
#' given their joint probability matrix.
#'
#' @param Pxy A numeric matrix representing the joint probability distribution \eqn{P_{ij}}
#' (rows correspond to values of \eqn{X}, columns correspond to values of \eqn{Y}).
#' All entries must be non-negative and sum to 1.
#' @param q A numeric scalar specifying the Rényi parameter. Must satisfy \eqn{q > 0} and \eqn{q \neq 1}.
#'
#' @return A numeric scalar giving the conditional Rényi extropy.
#'
#' @details
#' The conditional Rényi extropy is defined as:
#' \deqn{
#'   J_q(Y \mid X) = J_q(X, Y) - J_q(X)
#' }
#' where \eqn{J_q(\cdot)} denotes the Rényi extropy.
#' As \eqn{q \to 1}, this converges to the conditional Shannon extropy.
#'
#' @examples
#' Pxy <- matrix(c(0.2, 0.3, 0.1, 0.4), nrow = 2, byrow = TRUE)
#' conditional_renyi_extropy(Pxy, 2)
#'
#' @seealso [renyi_extropy()]
#' @export
conditional_renyi_extropy <- function(Pxy, q) {
  if (!is.matrix(Pxy) || any(Pxy < 0) || abs(sum(Pxy) - 1) > 1e-8)
    stop("Pxy must be a non-negative matrix with entries summing to 1")

  nX <- nrow(Pxy)
  nY <- ncol(Pxy)

  # Flatten for joint Renyi extropy
  P_joint <- as.vector(Pxy)
  Jq_XY <- {
    n_joint <- length(P_joint)
    if (abs(q - 1) < 1e-8) {
      comp <- 1 - P_joint
      valid <- comp > 0
      -sum(comp[valid] * log(comp[valid]))
    } else {
      (-(n_joint - 1) * log(n_joint - 1) +
         (n_joint - 1) * log(sum((1 - P_joint)^q))) / (1 - q)
    }
  }
  # Marginal for X
  Px <- rowSums(Pxy)
  Jq_X <- {
    n1 <- length(Px)
    if (abs(q - 1) < 1e-8) {
      comp <- 1 - Px
      valid <- comp > 0
      -sum(comp[valid] * log(comp[valid]))
    } else {
      (-(n1 - 1) * log(n1 - 1) +
         (n1 - 1) * log(sum((1 - Px)^q))) / (1 - q)
    }
  }
  return(Jq_XY - Jq_X)
}
