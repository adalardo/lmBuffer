lmBuffer <-
function(respData, distData, respName, predName, plotVar, rBuff = 1000, nSample = 50, maxRand = 10, minRand = 4)
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
        randPos <- vector()
        randPos[1] <- sample(pos,1)
        overPos <- vector()
        overPos <- sort(overBuffList[[randPos]])
        ii=2
        while(length(randPos) < maxRand & length(overPos)< nPlot)
        {
            resta <- pos[!pos %in% overPos]
            if(length(resta)==1)
            {
                randPos[ii] <- resta 
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
            next
        }
        else
        {
            randNPlot[rr] <- length(randPos)
            randPlot <- plotName[randPos]
            randResp <- respData[(respData[,plotVar] %in% randPlot) & (respData[,scaleName] == rBuff),]
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
    names(results) <- c("Nplots", "Buffer_radius", paste(rep(respName, each=2), c("slope", "r-squared"), sep="_"))
    return(results)
}
