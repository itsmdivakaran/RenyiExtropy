#' Calculate Conditional Entropy
#'
#' @param joint_matrix Matrix of joint probabilities. Rows = X outcomes, Cols = Y outcomes.
#'
#' @return Numeric value. Conditional entropy H(Y|X).
#'
#' @details
#' H(Y|X) = H(X,Y) - H(X)
#'
#' @export
conditional_entropy <- function(joint_matrix) {
  px <- rowSums(joint_matrix)
  return(joint_entropy(joint_matrix) - shannon_entropy(px))
}
