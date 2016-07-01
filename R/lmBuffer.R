#' Linear models from a random sample  
#'
#' @param respData Data frame with the reponse variables
#' @param distData A distance data matrix from samples in respData
#' @param respName A vector of names (characters) of the respose variables in respData. Only those are used to generate the linear models
#' @param predName Name of the predict variable present in respData
#' @param plotVar Column name with plot code in respData
#' @param rVar Column name with radii buffer data
#' @param rBuff Radius size of buffer. Single integer
#' @param nSample Number of random samples to draw
#' @param maxRand Maximum number of plot in each random sample
#' @param minRand Minimum number of plot in each random sample
#' @return Return a data frame with \code{slope} and \code{r-squared} for each sample draw 
#' @examples
#' data(respData)
#' data(distData)
#' #' respName <- c("sum.biom", "mean.biom", "prop.pion", "density")
#' plotVar <- "parcela"
#' rVar <- "buffer"
#' predName <- "forest"
#' rBuff = 1000
#' applyBuff(respData, distData=distData, respName, predName, plotVar, rBuff = rBuff, nSample = 5, maxRand = 10, minRand = 4)
lmBuffer <- function(respData, distData, respName, predName, plotVar, rVar, rBuff = 1000, nSample = 50, maxRand = 10, minRand = 4)
{
    nPlot <- dim(distData)[1]
    plotName <- unique(respData[,plotVar])
    pos <- 1:nPlot
    distVF <- distData < (2 * rBuff)
    overBuff <- which(distVF, arr.ind=TRUE)
    overBuffList <- overList(overBuff, nPlot)
    lmOut <- matrix(NA, ncol= length(respName) * 2, nrow = nSample)
    randNPlot <- vector()
    rr = 1
    while (rr <= nSample)
    {
        #cat(rr, "\n")
        randPos <- vector()
        randPos[1] <- sample(pos,1)
        overPos <- vector()
        overPos <- sort(overBuffList[[randPos]])
        ii=2
        while(length(randPos) < maxRand & length(overPos) < nPlot)
        {
            #cat(ii, ";")
            resta <- pos[!pos %in% overPos]
            if(length(resta)==1)
            {
                randPos[ii] <- resta
                break
            }
            else
            {
                randPos[ii] <- sample(resta, 1)
                over <- overBuffList[[randPos[ii]]]
                overPos <- sort(unique(c(over, overPos)))
                ii <- ii+1
            }
        }
            # redo if minRand is not reached
        if(length(randPos) < minRand)
        {
           rr=1 
           next
        }
        else
        {
            randNPlot[rr] <- length(randPos)
            randPlot <- plotName[randPos]
            randResp <- respData[(respData[ , plotVar] %in% randPlot) & (respData[ , rVar] == rBuff),]
                #################################
                #building lm models and eval them
                #################################
            lmExpr <- paste("lmOut[rr, ", 1:8,"] <- summary(lm(", rep(respName,each =2), " ~ ", predName, ", data = randResp))", "$", rep(c("coefficient[2]", "r.squared"), length(respName)), sep = "" )
            for (ll in 1:8)
            {
                eval(parse(text = lmExpr[ll]))
            }
        }
        rr = rr+1
    }
    results <-as.data.frame(cbind(randNPlot,  rep(rBuff, length(randNPlot)), lmOut))
    names(results) <- c("Nplots", "Buffer_radius", paste(rep(respName, each=2), c("slope", "rsquared"), sep="_"))
    return(results)
}

