\name{lmBuffer}
\alias{lmBuffer}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
lmBuffer(respData, distData, respName, predName, plotVar, rBuff = 1000, nSample = 50, maxRand = 10, minRand = 4)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{respData}{
%%     ~~Describe \code{respData} here~~
}
  \item{distData}{
%%     ~~Describe \code{distData} here~~
}
  \item{respName}{
%%     ~~Describe \code{respName} here~~
}
  \item{predName}{
%%     ~~Describe \code{predName} here~~
}
  \item{plotVar}{
%%     ~~Describe \code{plotVar} here~~
}
  \item{rBuff}{
%%     ~~Describe \code{rBuff} here~~
}
  \item{nSample}{
%%     ~~Describe \code{nSample} here~~
}
  \item{maxRand}{
%%     ~~Describe \code{maxRand} here~~
}
  \item{minRand}{
%%     ~~Describe \code{minRand} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (respData, distData, respName, predName, plotVar, rBuff = 1000, 
    nSample = 50, maxRand = 10, minRand = 4) 
{
    nPlot <- dim(distData)[1]
    plotName <- unique(respData[, plotVar])
    pos <- 1:nPlot
    distVF <- distData < (2 * rBuff)
    overBuff <- which(distVF, arr.ind = TRUE)
    overBuffList <- overList(overBuff, nPlot)
    lmOut <- matrix(NA, ncol = length(respName) * 2, nrow = nSample)
    randNPlot <- vector()
    rr = 1
    while (rr <= nSample) {
        randPos <- vector()
        randPos[1] <- sample(pos, 1)
        overPos <- vector()
        overPos <- sort(overBuffList[[randPos]])
        ii = 2
        while (length(randPos) < maxRand & length(overPos) < 
            nPlot) {
            resta <- pos[!pos \%in\% overPos]
            if (length(resta) == 1) {
                randPos[ii] <- resta
            }
            else {
                randPos[ii] <- sample(resta, 1)
                over <- overBuffList[[randPos[ii]]]
                overPos <- sort(unique(c(over, overPos)))
                ii <- ii + 1
            }
        }
        if (length(randPos) < minRand) {
            next
        }
        else {
            randNPlot[rr] <- length(randPos)
            randPlot <- plotName[randPos]
            randResp <- respData[(respData[, plotVar] \%in\% randPlot) & 
                (respData[, scaleName] == rBuff), ]
            lmExpr <- paste("lmOut[rr, ", 1:8, "] <- summary(lm(", 
                rep(respName, each = 2), " ~ ", predName, ", data = randResp))", 
                "$", rep(c("coefficient[2]", "r.squared"), length(respName)), 
                sep = "")
            for (ll in 1:8) {
                eval(parse(text = lmExpr[ll]))
            }
        }
        rr = rr + 1
    }
    results <- as.data.frame(cbind(randNPlot, rep(rBuff, length(randNPlot)), 
        lmOut))
    names(results) <- c("Nplots", "Buffer_radius", paste(rep(respName, 
        each = 2), c("slope", "r-squared"), sep = "_"))
    return(results)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
