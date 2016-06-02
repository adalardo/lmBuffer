#' Array index to a list
#' 
#' @param overBuff Index from an array (distance matrix) created with 'which' argument arr.index 
#' @param nPlot Maximum index number
#' @return A list with  of \code{x} and \code{y}
#' @examples
#' distVF <- as.matrix(dist(1:10)) > 5
#' indArr <- which(distVF, arr.ind=TRUE)
#' overList(indArr, 10)
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
