
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RMLViz

<!-- badges: start -->

[![R build
status](https://github.com/UBC-MDS/RMLViz/workflows/R-CMD-check/badge.svg)](https://github.com/UBC-MDS/RMLViz/actions)
[![codecov](https://codecov.io/gh/UBC-MDS/RMLViz/branch/master/graph/badge.svg)](https://codecov.io/gh/UBC-MDS/RMLViz)
<!-- badges: end -->

Visualization package for ML models.

> This package contains four functions to allow users to conveniently
> plot various visualizations as well as compare performance of
> different classifier models. The purpose of this package is to reduce
> time spent on developing visualizations and comparing models, to speed
> up the model creation process for data scientists. The four functions
> will perform the following tasks:

> 1.  Compare the performance of various models
> 
> 2.  Plot the confusion matrix based on the input data
> 
> 3.  Plot train/validation errors vs. parameter values
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

And the development version from [GitHub](https://github.com/) with:

    # install.packages("devtools")
    devtools::install_github("UBC-MDS/RMLViz")

## Functions

| Function Name             | Input                                                                      | Output                                                                  | Description                                                                                                                                                                                                  |
| ------------------------- | -------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| model\_comparison\_table  | List of model, X\_train, y\_train, X\_test, y\_test, scoring option        | Dataframe of model score                                                | Takes in a list of models and the train test data then outputs a table comparing the scores for different models.                                                                                            |
| confusion\_matrix         | Model, X\_train, y\_train, X\_test, y\_test, predicted\_y                  | Confusion Matrix Plot, Dataframe of various scores (Recall, F1 and etc) | Takes in a trained model with X and y values to produce a confusion matrix visual. If predicted\_y array is passed in, other evaluation scoring metrics such as Recall, and precision will also be produced. |
| plot\_train\_valid\_error | model\_name, X\_train, y\_train, X\_test, y\_test, param\_name, param\_vec | Train/validation errors vs. parameter values plot                       | Takes in a model name, train/validation data sets, a parameter name and a vector of parameter values to try and then plots train/validation errors vs. parameter values.                                     |
| plot\_roc                 | model, X\_valid, y\_valid                                                  | ROC plot                                                                | Takes in a fitted model, the validation set(X\_valid) and the validation set labels(y\_valid) and plots the ROC curve. The ROC curve also produces AUC score.                                                |

## Alignment with R Ecosystems

For all of our functions, there are not existing packages that implement
the exact same functionality in R. Most of these functions helps to show
insights about machine learning models conveniently.

## Dependencies

R version \>= 3.6.1 and R packages:

  - vctrs,
  - lifecycle,
  - pillar,
  - dplyr
  - tidyr
  - magrittr
  - ggplot2
  - broom
  - pls
  - covr
  - gbm
  - tibble
  - testthat
  - purrr
  - pROC
  - plotROC
  - datasets
  - class
  - rpart
  - randomForest
  - e1071
  - mlbench
  - caTools
  - caret

## Usage and example

1.  `model_comparison_table`

<!-- end list -->

``` r
library(RMLViz)
library(mlbench)
#> Warning: package 'mlbench' was built under R version 3.6.3
data(Sonar)

toy_classification_data <- dplyr::select(dplyr::as_tibble(Sonar), V1, V2, V3, V4, V5, Class)

train_ind <- caret::createDataPartition(toy_classification_data$Class, p=0.9, list=F)

train_set_cf <- toy_classification_data[train_ind, ]
test_set_cf <- toy_classification_data[-train_ind, ]

## classification models setup
gbm <- caret::train(Class~., train_set_cf, method="gbm", verbose=F)
#> Warning: package 'caret' was built under R version 3.6.2
lm_cf <- caret::train(Class~., train_set_cf, method="LogitBoost", verbose=F)

model_comparison_table(train_set_cf, test_set_cf,
                       gbm_mod=gbm, log_mod = lm_cf)
#> # A tibble: 2 x 5
#>   model   train_Accuracy train_Kappa test_Accuracy test_Kappa
#>   <chr>            <dbl>       <dbl>         <dbl>      <dbl>
#> 1 gbm_mod          0.729       0.448          0.65     0.3   
#> 2 log_mod          0.803       0.598          0.55     0.0816
```

2.  `confusion_matrix`

<!-- end list -->

``` r
library(RMLViz)
data(iris)

set.seed(123)
split <- caTools::sample.split(iris$Species, SplitRatio = 0.75)

training_set <- subset(iris, split == TRUE)
valid_set <- subset(iris, split == FALSE)

X_train <- training_set[, -5]
y_train <- training_set[, 5]
X_valid <- valid_set[, -5]
y_valid <- valid_set[, 5]

predict <- class::knn(X_train, X_train, y_train, k = 5)

confusion_matrix(y_train, predict)
```

<img src="man/figures/README-2-1.png" width="100%" />

    #>                   Sensitivity Specificity Pos Pred Value Neg Pred Value Precision
    #> Class: setosa       1.0000000   1.0000000           1.00       1.000000      1.00
    #> Class: versicolor   0.9473684   1.0000000           1.00       0.974359      1.00
    #> Class: virginica    1.0000000   0.9736842           0.95       1.000000      0.95
    #>                      Recall       F1 Prevalence Detection Rate Detection Prevalence
    #> Class: setosa     1.0000000 1.000000  0.3333333      0.3333333            0.3333333
    #> Class: versicolor 0.9473684 0.972973  0.3333333      0.3157895            0.3157895
    #> Class: virginica  1.0000000 0.974359  0.3333333      0.3333333            0.3508772
    #>                   Balanced Accuracy
    #> Class: setosa             1.0000000
    #> Class: versicolor         0.9736842
    #> Class: virginica          0.9868421

3.  `plot_train_valid_error`

<!-- end list -->

``` r
library(RMLViz)
data(iris)

set.seed(123)
split <- caTools::sample.split(iris$Species, SplitRatio = 0.75)

training_set <- subset(iris, split == TRUE)
valid_set <- subset(iris, split == FALSE)

X_train <- training_set[, -5]
y_train <- training_set[, 5]
X_valid <- valid_set[, -5]
y_valid <- valid_set[, 5]

plot_train_valid_error('knn', 
                       X_train, y_train, 
                       X_valid, y_valid, 
                       'k', seq(50))
```

<img src="man/figures/README-3-1.png" width="100%" />

4.  `plot_roc`

<!-- end list -->

``` r
library(RMLViz)
set.seed(420)
num.samples <- 100
weight <- sort(rnorm(n=num.samples, mean=172, sd=29))
obese <- ifelse(test=(runif(n=num.samples) < (rank(weight)/num.samples)),
                yes=1, no=0)

glm.fit=glm(obese ~ weight, family=binomial)
obese_proba <- glm.fit$fitted.values

plot_roc(obese, obese_proba)
```

<img src="man/figures/README-4-1.png" width="100%" />
