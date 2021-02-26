# Title     : R crosscheck
# Objective : Double check ANCOVA and mixed linear regression computations
# Created by: mathieu
# Created on: 21/01/2021

# Load library and data
library(carData)
library(effects)
library(car)
Data <- read.table("/home/mathieu/Documents/Post-Msc/04_Results/02_General_LinearRegression/Healthy_RData.csv", header=TRUE, sep=",")

# Check data
dim(Data)
Data[sort(sample(3528, 12)),]

# Build linear regression models for ANCOVA
Model1.mod <- lm(LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1, data = Data)
summary(Model1.mod)

Model2.mod <- lm(LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + LogCV - 1, data = Data)
summary(Model2.mod)

anova(Model1.mod,Model2.mod)

# Mixed-linear model computation
library(lme4)

LM1 = lmer(LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1 + (Sii-1|Scan) + (Sij-1|Scan) + (Sjj-1|Scan),
           REML = TRUE,
           data = Data)
summary(LM1)

LM2 = lmer(LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + LogCV - 1 + (Sii-1|Scan) + (Sij-1|Scan) + (Sjj-1|Scan),
           REML = TRUE,
           data = Data)
summary(LM2)

anova(LM2,LM1)
