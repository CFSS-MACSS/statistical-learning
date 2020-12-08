library(tidyverse)
library(broom)
library(modelr)
library(rcfss)

# the dataset
scorecard

# What is the relationship between admission rate and net cost?
# Report this relationship using a scatterplot and a linear best-fit line.


# Estimate a linear regression of the relationship between admission rate and net cost,
# and report your results in a tidy table.
scorecard_mod <- lm(________, data = scorecard)
________(scorecard_mod)

# Estimate separate linear regression models of the relationship between
# admission rate and net cost for each type of college. Report the estimated parameters
# and standard errors in a tidy data frame.

## model-building function
type_model <- function(df) {
  lm(________, data = df)
}

## nest the data frame
by_type <- scorecard %>%
  group_by(________) %>%
  ________()
by_type

## estimate the models
by_type <- by_type %>%
  mutate(model = ________)
by_type

## extract the parameters and print a tidy data frame
by_type %>%
  mutate(results = ________) %>%
  ________(results)
