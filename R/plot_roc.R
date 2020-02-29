#' creates a ROC plot
#'
#' Takes in a vector of prediction labels and a vector of prediction probabilities.
#'
#' @param y_label a vector contains the validation set label
#' @param predict_prob a vector contains the prediction probabilities
#'
#' @return A plot
#' @export
#' @examples
#' plot_roc(df$labels,df$predictions)
plot_roc <- function(y_label,predict_prob) {
  roc(y_label,predict_prob,
      smoothed = TRUE,
      # arguments for ci
      ci=TRUE, ci.alpha=0.9, stratified=FALSE,
      # arguments for plot
      plot=TRUE, auc.polygon=FALSE, max.auc.polygon=TRUE, grid=TRUE,
      print.auc=TRUE, show.thres=TRUE)

}
