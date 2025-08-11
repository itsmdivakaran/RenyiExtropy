#' Calculate Joint Entropy
#'
#' @param joint_matrix Matrix of joint probabilities. Rows = X outcomes, Cols = Y outcomes.
#'
#' @return Numeric value. Joint entropy H(X,Y).
#'
#' @export
joint_entropy <- function(joint_matrix) {
  if (any(joint_matrix < 0) || abs(sum(joint_matrix) - 1) > 1e-8)
    stop("Input must be a valid joint probability matrix.")
  p_nonzero <- joint_matrix[joint_matrix > 0]
  return(-sum(p_nonzero * log(p_nonzero)))
}
