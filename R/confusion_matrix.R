#' Takes in a trained model with X and y values to produce a confusion matrix
#' visual. If predicted_y array is passed in,other evaluation scoring metrics such as
#' Recall, and precision will also be produced
#'
#' Implementation based on https://stackoverflow.com/a/59119854
#'
#' @param actual_y a data frame of the validation labels
#' @param predicted_y a data frame of predicted values with model
#' @param labels a list of string of confusion matrix labels
#' @param title a string of the confusion matrix label
#'
#' @return A plot and a dataframe with scoring metrics
#' @export
#'
#' @examples
#' confusion_matrix(svm, X_train, y_train, X_valid, y_valid)
confusion_matrix <- function(actual_y, predicted_y, labels = NULL, title = NULL){

  if (!is.vector(predicted_y) && !is.factor(predicted_y)){
    stop("Sorry, y_valid should be a vector or factor.")
  }

  if (!is.vector(actual_y) && !is.factor(actual_y)){
    stop("Sorry, y_valid should be a vector or factor.")
  }

  confusion_matrix <- confusionMatrix(predicted_y, actual_y)

  table <- data.frame(confusion_matrix$table)




  plot_table <- table %>%
    mutate(goodbad = ifelse(table$Prediction == table$Reference, "good", "bad")) %>%
    group_by(Reference) %>%
    mutate(prop = Freq/sum(Freq))





  confusion_plot <- ggplot(data = plot_table, mapping = aes(x = Reference, y = Prediction, fill = goodbad, alpha = prop)) +
    geom_tile() +
    geom_text(aes(label = Freq), vjust = .5, fontface  = "bold", alpha = 1) +
    scale_fill_manual(values = c(good = "green", bad = "red")) +
    theme_bw() +
    xlim(rev(levels(table$Reference))) +
    theme(legend.position = "none")

  metric_score <- tidy(confusion_matrix$byClass)

  print(confusion_plot)

  return(metric_score)
}
