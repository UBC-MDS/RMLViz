#' Takes in a trained model with X and y values to produce a confusion matrix
#' visual. If predicted_y array is passed in,other evaluation scoring metrics such as
#' Recall, and precision will also be produced
#'
#' @param model trained model
#' @param X_train a data frame of the training dataset without labels
#' @param X_test a data frame of the validation dataset without labels
#' @param y_train a data frame of the training labels
#' @param y_test a data frame of the validation labels
#' @param predicted_y a data frame of predicted values with model
#' @param labels a list of string of confusion matrix labels
#' @param title a string of the confusion matrix label
#'
#' @return A plot
#' @export
#'
#' @examples
#' confusion_matrix(svm, X_train, y_train, X_valid, y_valid)
confusion_matrix <- function(model, X_train, X_test, y_train, y_test, predicted_y = NULL, labels = NULL, title = NULL){

}
