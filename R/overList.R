overList <-
function(overBuff, nPlot)
{ 
    oList <- list()
    for(i in 1:nPlot)
    {
        oList[[i]] <- unique(as.vector(overBuff[apply(overBuff==i, 1, sum)>0,] ))
    }
    return(oList)
}
