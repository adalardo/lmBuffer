# lmBuffer
A R package for sample randomization and linear models output for radii buffers to exclude buffer overlap between observation

## Installing the package

Install and load devtools:
```r
install.packages("devtools")
library(devtools)
```
Install this version from github and load it:
```r
install_github(repo = 'adalardo/lmBuffer')
library(lmBuffer)
```
### Running and testing
```r
data(respData)
data(distData)
respName <- c("sum.biom", "mean.biom", "prop.pion", "density")
plotVar <- "parcela"
rVar <- "buffer"
predName <- "forest"
rBuff <- seq(100, 1500, by=100)
resBuffer<- applyBuff(respData, distData=distData, respName, predName, plotVar, rVar, rBuff = rBuff, nSample = 5, maxRand = 10, minRand = 4)
```