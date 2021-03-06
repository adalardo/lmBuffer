% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/applyBuff.R
\name{applyBuff}
\alias{applyBuff}
\title{Vectorized function to run lmBuffer on a vector of buffers radii}
\usage{
applyBuff(respData, distData = distData, respName, predName, plotVar,
  rBuff = seq(100, 1500, by = 100), nSample = 50, maxRand = 10,
  minRand = 4)
}
\arguments{
\item{respData}{Data frame with the reponse variables}

\item{distData}{A distance data matrix from samples in respData}

\item{respName}{A vector of names (characters) of the respose variables in respData. Only those are used to generate the linear models}

\item{predName}{Name of the predict variable present in respData}

\item{plotVar}{Column name with plot code in respData}

\item{rBuff}{Vector of radiis of buffer}

\item{nSample}{Number of random samples to draw}

\item{maxRand}{Maximum number of plot in each random sample}

\item{minRand}{Minimum number of plot in each random sample}
}
\value{
Return a data frame with \code{slope} and \code{r-squared} for each sample draw
}
\description{
Vectorized function to run lmBuffer on a vector of buffers radii
}
\examples{
data(respData)
data(distData)
respName <- c("sum.biom", "mean.biom", "prop.pion", "density")
plotVar <- "parcela"
predName <- "forest"
rBuff <- seq(100, 1500, by=100)
applyBuff(respData, distData=distData, respName, predName, plotVar, rBuff = rBuff, nSample = 5, maxRand = 10, minRand = 4)
}

