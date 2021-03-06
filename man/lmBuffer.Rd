% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lmBuffer.R, R/packagePage.R
\docType{package}
\name{lmBuffer}
\alias{lmBuff}
\alias{lmBuffer}
\alias{lmBuffer-package}
\title{Linear models from a random sample}
\usage{
lmBuffer(respData, distData, respName, predName, plotVar, rBuff = 1000,
  nSample = 50, maxRand = 10, minRand = 4)
}
\arguments{
\item{respData}{Data frame with the reponse variables}

\item{distData}{A distance data matrix from samples in respData}

\item{respName}{A vector of names (characters) of the respose variables in respData. Only those are used to generate the linear models}

\item{predName}{Name of the predict variable present in respData}

\item{plotVar}{Column name with plot code in respData}

\item{rBuff}{Radius size of buffer. Single integer}

\item{nSample}{Number of random samples to draw}

\item{maxRand}{Maximum number of plot in each random sample}

\item{minRand}{Minimum number of plot in each random sample}
}
\value{
Return a data frame with \code{slope} and \code{r-squared} for each sample draw
}
\description{
Linear models from a random sample

A R package for sample randomization and to build linear models for buffers with different radii, but excluding overlap between observations
}
\details{
\tabular{ll}{
Package: \tab lmBuffer\cr
Version: \tab 0.01 \cr
Date: \tab 2016-06-01\cr
Licence: \tab GPL (>=2)\cr
}

Using a vector of buffer radii to random sample observations without overlap at the buffer size
}
\examples{
data(respData)
data(distData)
#' respName <- c("sum.biom", "mean.biom", "prop.pion", "density")
plotVar <- "parcela"
predName <- "forest"
rBuff = 1000
applyBuff(respData, distData=distData, respName, predName, plotVar, rBuff = rBuff, nSample = 5, maxRand = 10, minRand = 4)
data(respData)
data(distData)
respName <- c("sum.biom", "mean.biom", "prop.pion", "density")
plotVar <- "parcela"
predName <- "forest"
rBuff <- seq(100, 1500, by=100)
applyBuff(respData, distData=distData, respName, predName, plotVar, rBuff = seq(100, 1500, by=100), nSample = 5, maxRand = 10, minRand = 4)
}
\author{
Alexandre Adalardo de Oliveira \email{aleadalardo@gmail.com}

Melina Oliveira Melito \email{melinamelito@gmail.com}
Create a list from a matrix index
}

