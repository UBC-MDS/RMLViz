#' model_comparison_table
#' Takes in training data, testing data,
#' with the target as the last column and
#' fitted models with meaningful names,
#' then generates a model comparison
#' table.
#' @import dplyr
#' @import caret
#' @import mlbench
#'
#' @param train_data tibble of training data with target as last column
#' @param test_data tibble of testing data with target as last column
#' @param ... fitted models assigned to meaningful model names
#'
#' @return tibble of results, allowing you to compare models
#' @export
#'
#' @examples
model_comparison_table <- function(train_data, test_data, ...) {

  dots <- list(...)
  mod_names <- names(dots)

  count <- 1
  for (mod in dots){
    if (count == 1){
      df_res <- tibble("model" = mod_names[count])

      # training results
      train_pred_res <- make_result_row(mod, train_data)
      colnames(train_pred_res) <- paste("train", colnames(train_pred_res), sep = "_")

      # test results
      test_pred_res <- make_result_row(mod, test_data)
      colnames(test_pred_res) <- paste("test", colnames(test_pred_res), sep = "_")

      # cbind to df_res
      df_res <- cbind(df_res, train_pred_res, test_pred_res)

    } else {
      df_res_dummy <- tibble("model" = mod_names[count])

      # training results
      train_pred_res <- make_result_row(mod, train_data)
      colnames(train_pred_res) <- paste("train", colnames(train_pred_res), sep = "_")

      # test results
      test_pred_res <- make_result_row(mod, test_data)
      colnames(test_pred_res) <- paste("test", colnames(test_pred_res), sep = "_")

      # cbind to df_res_dummy
      df_res_dummy <- cbind(df_res_dummy, train_pred_res, test_pred_res)

      # rbind to df_res
      df_res <- rbind(df_res, df_res_dummy)
    }

    count <- count + 1
  }
  as_tibble(df_res)
}


make_result_row <- function(model, df){

  pred_vals <- predict(model, df)
  true_vals <- pull(select(df, length(colnames(df))))
  res <- postResample(pred_vals, true_vals)
  res_row_table <- as_tibble(t(res))
  res_row_table
}
