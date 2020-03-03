
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RMLViz

<!-- badges: start -->

<!-- badges: end -->

Visualization package for ML models.

> This package contains four functions to allow users to conveniently plot various visualizations as well as compare performance of different classifier models. The purpose of this package is to reduce time spent on developing visualizations and comparing models, to speed up the model creation process for data scientists. The four functions will perform the following tasks: 

> 1.  Compare the performance of various models
> 
> 2.  Plot the confusion matrix based on the input data
> 
> 3.  Plot train/validation accuracies vs. parameter values
> 
> 4.  Plot the ROC curve and calculate the AUC

| Contributors  | GitHub Handle                                   |
| ------------- | ----------------------------------------------- |
| Anas Muhammad | [anasm-17](https://github.com/anasm-17)         |
| Tao Huang     | [taohuang-ubc](https://github.com/taohuang-ubc) |
| Fanli Zhou    | [flizhou](https://github.com/flizhou)           |
| Mike Chen     | [miketianchen](https://github.com/miketianchen) |

## Installation

You can install the released version of RMLViz from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("RMLViz")
```

## Functions

| Function Name            | Input                                                                      | Output                                                                  | Description                                                                                                                                                                                                  |
| ------------------------ | -------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| model\_comparison\_table | List of model, X\_train, y\_train, X\_test, y\_test, scoring option        | Dataframe of model score                                                | Takes in a list of models and the train test data then outputs a table comparing the scores for different models.                                                                                            |
| confusion\_matrix        | Model, X\_train, y\_train, X\_test, y\_test, predicted\_y                  | Confusion Matrix Plot, Dataframe of various scores (Recall, F1 and etc) | Takes in a trained model with X and y values to produce a confusion matrix visual. If predicted\_y array is passed in, other evaluation scoring metrics such as Recall, and precision will also be produced. |
| plot\_train\_valid\_acc  | model\_name, X\_train, y\_train, X\_test, y\_test, param\_name, param\_vec | Train/validation accuracies vs. parameter values plot                   | Takes in a model name, train/validation data sets, a parameter name and a vector of parameter values to try and then plots train/validation accuracies vs. parameter values.                                 |
| plot\_roc                | model, X\_valid, y\_valid                                                  | ROC plot                                                                | Takes in a fitted model, the validation set(X\_valid) and the validation set labels(y\_valid) and plots the ROC curve. The ROC curve also produces AUC score                                                 |

## Example

## Alignment with R Ecosystems

For all of our functions, there are not existing packages that implement the exact same functionality in R. Most of these functions helps to show insights about machine learning models conveniently.
