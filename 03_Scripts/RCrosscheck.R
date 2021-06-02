# Title     : R crosscheck
# Objective : Double check ANCOVA and mixed linear regression computations
# Created by: mathieu
# Created on: 21/01/2021

# Load library and data
library(carData)
library(effects)
library(car)
Data <- read.table("/home/mathieu/Documents/Post-Msc/04_Results/04_General_LinearRegression/OI_RData.csv", header=TRUE, sep=",")
Data <- read.table("/home/mathieu/Documents/Post-Msc/Test.csv", header=TRUE, sep=",")


# Check data
dim(Data)
Data[sort(sample(3528, 12)),]

# Build linear regression models for ANCOVA
LM1 <- lm(LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1, data = Data)
summary(LM1)

LM2 <- lm(LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + LogCV - 1, data = Data)
summary(LM2)

anova(LM1,LM2)

# Mixed-linear model computation
library(lme4)

LMM1 = lmer(LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy - 1 + (IF-1|Scan),
           REML = TRUE,
           data = Data)
summary(LMM1)

LMM2 = lmer(LogSxy ~ Sii + Sij + Sjj + LogBVTV + Logmxy + LogCV - 1 + (IF-1|Scan),
           REML = TRUE,
           data = Data)
summary(LMM2)

anova(LMM2,LMM1)

# Mixed-linear model computation
library(lme4)

LMM1 = lmer(tBMD ~ BVTV + Group + BVTV*Group + (1|Scan),
           REML = TRUE,
           data = Data)
summary(LMM1)

LMM2 = lmer(tBMD ~ BVTV + Group + (1|Scan),
           REML = TRUE,
           data = Data)
summary(LMM2)

anova(LMM2,LMM1)

library(secr)
LR.test(LM1,LMM1)