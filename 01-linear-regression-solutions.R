library(tidyverse)
library(broom)
library(modelr)
library(rcfss)

# the dataset
scorecard

# What is the relationship between admission rate and net cost?
# Report this relationship using a scatterplot and a linear best-fit line.
ggplot(scorecard, aes(admrate, netcost)) +
  geom_point() +
  geom_smooth(method = "lm")

# Estimate a linear regression of the relationship between admission rate and net cost,
# and report your results in a tidy table.
scorecard_mod <- lm(netcost ~ admrate, data = scorecard)
tidy(scorecard_mod)

# Estimate separate linear regression models of the relationship between
# admission rate and net cost for each type of college. Report the estimated parameters
# and standard errors in a tidy data frame.

## model-building function
type_model <- function(df) {
  lm(netcost ~ admrate, data = df)
}

## nest the data frame
by_type <- scorecard %>%
  group_by(type) %>%
  nest()
by_type

## estimate the models
by_type <- by_type %>%
  mutate(model = map(data, type_model))
by_type

## extract the parameters and print a tidy data frame
by_type %>%
  mutate(results = map(model, tidy)) %>%
  unnest(results)
