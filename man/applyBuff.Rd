\name{applyBuff}
\alias{applyBuff}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
applyBuff(respData, distData = distData, respName, predName, plotVar, rBuff = seq(100, 1500, by = 100), nSample = 50, maxRand = 10, minRand = 4)
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
function (respData, distData = distData, respName, predName, 
    plotVar, rBuff = seq(100, 1500, by = 100), nSample = 50, 
    maxRand = 10, minRand = 4) 
{
    resBuff <- data.frame()
    vecBuff <- Vectorize(lmBuffer, vectorize.args = "rBuff", 
        SIMPLIFY = FALSE, USE.NAMES = TRUE)
    listBuff <- vecBuff(respData, distData = distData, respName, 
        predName, plotVar, rBuff = rBuff, nSample = nSample, 
        maxRand = maxRand, minRand = minRand)
    for (i in listBuff) {
        resBuff <- rbind(resBuff, i)
    }
    return(resBuff)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
