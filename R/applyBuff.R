#' Vectorized function to run lmBuffer on a vector of buffers radii
#' 
#' @param respData Data frame with the reponse variables
#' @param distData A distance data matrix from samples in respData
#' @param respName A vector of names (characters) of the respose variables in respData. Only those are used to generate the linear models
#' @param predName Name of the predict variable present in respData
#' @param plotVar Column name with plot code in respData
#' @param rVar Column name with radii buffer data
#' @param rBuff Vector of radiis of buffer
#' @param nSample Number of random samples to draw
#' @param maxRand Maximum number of plot in each random sample
#' @param minRand Minimum number of plot in each random sample
#' @return Return a data frame with \code{slope} and \code{r-squared} for each sample draw 
#' @examples
#' data(respData)
#' data(distData)
#' respName <- c("sum.biom", "mean.biom", "prop.pion", "density")
#' plotVar <- "parcela"
#' rVar <- "buffer"
#' predName <- "forest"
#' rBuff <- seq(100, 1500, by=100)
#' applyBuff(respData, distData=distData, respName, predName, plotVar, rVar, rBuff = rBuff, nSample = 5, maxRand = 10, minRand = 4)
applyBuff <-
function(respData, distData=distData, respName, predName, plotVar, rVar, rBuff = seq(100, 1500, by=100), nSample = 50, maxRand = 10, minRand = 4)
{
    resBuff <- data.frame()
    vecBuff <- Vectorize(lmBuffer, vectorize.args = "rBuff", SIMPLIFY = FALSE, USE.NAMES = TRUE)
    listBuff <- vecBuff(respData, distData=distData, respName, predName, plotVar, rVar, rBuff = rBuff, nSample = nSample, maxRand = maxRand, minRand = minRand)
    for(i in listBuff)
    {
        resBuff <- rbind(resBuff, i)
    }
    return(resBuff)
}
