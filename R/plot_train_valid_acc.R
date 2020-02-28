#' plot train/validation accuracies vs. parameter values
#'
#' Takes in a model name, train/validation data sets,
#' a parameter name and a vector of parameter values
#' to try and then plots train/validation accuracies vs.
#' parameter values.
#'
#' @param model_name a string of the machine learning model name
#' @param X_train a data frame of the training dataset without labels
#' @param y_train a data frame of the training labels
#' @param X_valid a data frame of the validation dataset without labels
#' @param y_valid a data frame of the validation labels
#' @param param_name a string of the parameter name
#' @param param_vec a vector of the parameter values
#'
#' @return A plot
#' @export
#' @examples
#' plot_train_valid_acc("decision tree", X_train, y_train, X_valid, y_valid, "depth", c(1, 5, 10, 15, 20))
plot_train_valid_acc <- function(model_name, X_train, y_train, X_valid, y_valid, param_name, param_vec) {

}
