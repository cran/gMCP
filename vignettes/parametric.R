### R code from vignette source 'parametric.Rnw'

###################################################
### code chunk number 1: parametric.Rnw:164-170
###################################################
Gm <- matrix(0,nr=4,nc=4)
Gm[1,3] <- 1
Gm[2,4] <- 1
Gm[3,2] <- 1
Gm[4,1] <- 1
Gm


###################################################
### code chunk number 2: parametric.Rnw:182-184
###################################################
w <- c(1/2,1/2,0,0)
w


###################################################
### code chunk number 3: parametric.Rnw:211-221
###################################################
Cm <- matrix(NA,nr=4,nc=4)
diag(Cm) <- 1
Cm1 <- Cm
Cm[1,2] <- 1/2
Cm[2,1] <- 1/2
Cm[3,4] <- 1/2
Cm[4,3] <- 1/2
Cm2 <- Cm
Cm1
Cm2


###################################################
### code chunk number 4: parametric.Rnw:250-253 (eval = FALSE)
###################################################
## library(gMCP)
## graphGUI()
## 


###################################################
### code chunk number 5: parametric.Rnw:270-272 (eval = FALSE)
###################################################
## Gm <- graph2matrix(createdGraph)
## w <- getWeights(createdGraph)


###################################################
### code chunk number 6: parametric.Rnw:278-280 (eval = FALSE)
###################################################
## G <- matrix2graph(Gm,weights=w)
## graphGUI(G)


###################################################
### code chunk number 7: parametric.Rnw:303-305
###################################################
library(gMCP)
generateWeights(Gm,w)


###################################################
### code chunk number 8: parametric.Rnw:324-326
###################################################
generateBounds(Gm,w,Cm1,al=.025)
generateBounds(Gm,w,Cm2,al=.025)


###################################################
### code chunk number 9: parametric.Rnw:332-333
###################################################
(1-pnorm(generateBounds(Gm,w,Cm2,al=.025)))*100


###################################################
### code chunk number 10: parametric.Rnw:357-359
###################################################
Example1 <- generateTest(Gm,w,Cm1,al=.025)
Example2 <- generateTest(Gm,w,Cm2,al=.025)


###################################################
### code chunk number 11: parametric.Rnw:370-372
###################################################
Example1(c(2.24,2.24,2.24,2.3))
Example2(c(2.24,2.24,2.24,2.3))


###################################################
### code chunk number 12: parametric.Rnw:405-408
###################################################
p <- 1-pnorm(c(2.24,2.24,2.24,2.3))
G <- matrix2graph(Gm,w)
gMCP(G,p)


###################################################
### code chunk number 13: parametric.Rnw:431-432
###################################################
gMCP(G,p,corr=Cm2,test="Bretz2011")


