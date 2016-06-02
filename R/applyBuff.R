applyBuff <-
function(respData, distData=distData, respName, predName, plotVar, rBuff = seq(100, 1500, by=100), nSample = 50, maxRand = 10, minRand = 4)
{
    resBuff <- data.frame()
    vecBuff <- Vectorize(lmBuffer, vectorize.args = "rBuff", SIMPLIFY = FALSE, USE.NAMES = TRUE)
    listBuff <- vecBuff(respData, distData=distData, respName, predName, plotVar, rBuff = rBuff, nSample = nSample, maxRand = maxRand, minRand = minRand)
    for(i in listBuff)
    {
        resBuff <- rbind(resBuff, i)
    }
    return(resBuff)
}
