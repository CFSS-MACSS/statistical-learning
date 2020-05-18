library(tidyverse)
library(broom)
library(modelr)
library(rcfss)

# the dataset
mental_health

# Estimate a logistic regression model of voter turnout with `mhealth` as the predictor.
# Estimate predicted probabilities and plot the logistic regression line using `ggplot`.

## estimate model
mh_model <- glm(________, data = mental_health,
                family = binomial)
tidy(mh_model)

## estimate predicted probabilities
mh_health <- augment(mh_model,
                     newdata = ________,
                     type.predict = "response")
mh_health

## graph the line
ggplot(mh_health, aes(________, ________)) +
  geom_line() +
  scale_y_continuous(limits = c(0, 1))

# Calculate the error rate of the model.
mh_model_accuracy <- augment(mh_model, type.predict = "response") %>%
  mutate(.pred = as.numeric(.fitted > .5))

(mh_model_err <- mean(mh_model_accuracy$vote96 != mh_model_accuracy$.pred,
                      na.rm = TRUE))

# Estimate a second logistic regression model of voter turnout using all the predictors.
# Calculate it's error rate, and compare it to the original model. Which is better?

## estimate model
mh_model_all <- glm(________, data = mental_health,
                    family = binomial)
tidy(mh_model_all)

## calculate error rate
