plot_roc <- function(y_label,predict_prob) {
  roc(y_label,predict_prob,
      smoothed = TRUE,
      # arguments for ci
      ci=TRUE, ci.alpha=0.9, stratified=FALSE,
      # arguments for plot
      plot=TRUE, auc.polygon=FALSE, max.auc.polygon=TRUE, grid=TRUE,
      print.auc=TRUE, show.thres=TRUE)

}
