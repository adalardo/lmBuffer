#' A R package for sample randomization and to build linear models for buffers with different radii, but excluding overlap between observations
#' 
#' \tabular{ll}{
#' Package: \tab lmBuffer\cr
#' Version: \tab 0.01 \cr
#' Date: \tab 2016-06-01\cr
#' Licence: \tab GPL (>=2)\cr
#' }
#' 
#' Using a vector of buffer radii to random sample observations without overlap at the buffer size
#'
#' @name lmBuffer
#' @aliases lmBuff
#' @docType package
#' @title Linear models repeating random subsample without buffer overlap between observation
#' @author Alexandre Adalardo de Oliveira \email{aleadalardo@gmail.com}
#' @author Melina Oliveira Melito \email{melinamelito@gmail.com}
#' Create a list from a matrix index
#' @examples
#' data(respData)
#' data(distData)
#' respName <- c("sum.biom", "mean.biom", "prop.pion", "density")
#' plotVar <- "parcela"
#' rvar <- "buffer"
#' predName <- "forest"
#' rBuff <- seq(100, 1500, by=100)
#' applyBuff(respData, distData=distData, respName, predName, plotVar, rVar, rBuff = seq(100, 1500, by=100), nSample = 5, maxRand = 10, minRand = 4)
NULL
