# Title     : R crosscheck
# Objective : Double check ANCOVA and mixed linear regression computations
# Created by: mathieu
# Created on: 21/01/2021

# Load library and data
library(carData)
library(effects)
library(car)
Data <- read.table("/home/mathieu/Documents/Post-Msc/04_Results/06_ANCOVA/RData.csv", header=TRUE, sep=",")

# Check data
dim(Data)
Data[sort(sample(5220, 12)),]

# Build linear regression models for ANCOVA
Model1.mod <- lm(log(Sxy) ~ Sii + Sij + Sjj + log(BVTV) + log(mxy) - 1, data = Data)
summary(Model1.mod)

Model2.mod <- lm(log(Sxy) ~ Sii + Sij + Sjj + log(BVTV) + log(mxy)
                      + (Sii + Sij + Sjj):Sg - 1, data = Data)
summary(Model2.mod)

Model3.mod <- lm(log(Sxy) ~ Sii + Sij + Sjj + log(BVTV) + log(mxy)
                      + (Sii + Sij + Sjj):log(CV) - 1, data = Data)
summary(Model3.mod)

anova(Model1.mod,Model2.mod)
anova(Model1.mod,Model3.mod)

Model4.mod <- lm(log(Sxy) ~ Sii + Sij + Sjj + log(BVTV) + log(mxy)
                      + (Sii + Sij + Sjj):Sg
                      + (Sii + Sij + Sjj):log(CV) - 1, data = Data)
summary(Model4.mod)

anova(Model2.mod,Model4.mod)
anova(Model3.mod,Model4.mod)

Model5.mod <- lm(log(Sxy) ~ Sii + Sij + Sjj + log(BVTV) + log(mxy)
                      + (Sii + Sij + Sjj):Sg
                      + (Sii + Sij + Sjj):log(CV)
                      + Sg:log(CV)- 1, data = Data)
summary(Model5.mod)

anova(Model4.mod,Model5.mod)

# Check normality of residuals
qqPlot(Model1.mod)

# Perform ANCOVA
anova(Model4.mod,Model3.mod)
anova(Model4.mod,Model5.mod)
anova(Model4.mod,Model6.mod)



# Mixed-linear model computation
library(lme4)

LM = lmer(log(Sxy) ~ Sii + Sij + Sjj + log(BVTV) + log(mxy)
           + (Sii + Sij + Sjj):Sg - 1 + (Sii-1|SubjectID) + (Sij-1|SubjectID) + (Sjj-1|SubjectID),
           REML = TRUE,
           data = Data)
summary(LM)

LM = lmer(log(Sxy) ~ Sii + Sij + Sjj + log(BVTV) + log(mxy)
           + (Sii + Sij + Sjj):Sg - 1 + (Sii+Sij+Sjj-1|SubjectID),
           REML = TRUE,
           data = Data)
summary(LM)

anova(LM2,LM1)
anova(LM3,LM2)
anova(LM4,LM3)
anova(LM4,LM5)
anova(LM4,LM6)
anova(LM1,LM7)