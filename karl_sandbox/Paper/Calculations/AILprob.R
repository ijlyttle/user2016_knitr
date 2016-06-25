######################################################################
# AILprob.R
#
# Karl Broman, 13 July 2011
#
# calculations of haplotype probabilities in AIL
######################################################################

######################################################################
# hapAAail:
#
# Probability of AA haplotype in AIL
# 
# For X chr, we assume balance of A and B (that is, start with male
# F1s being 1/2 from A x B and 1/2 from B x A)
#           
######################################################################
hapAAail <-
function(r, k, what=c("autosome", "femaleX", "maleX"))
{
  what <- match.arg(what)
  if(any(k < 2)) stop("must have k > 2")
  if(any(r < 0 | r > 1/2)) stop("r must be between 0 and 1/2")

  if(what != "autosome") {
    z <- sqrt((9-r)*(1-r))
    wk <- ((1-r-z)/4)^(k-2)
    yk <- ((1-r+z)/4)^(k-2)
  }

  switch(what,
         "autosome"= 1/4 + (1-2*r)*(1-r)^(k-2)/4,

         "femaleX" = 1/4 + (yk + wk)*(1-r)/8   + (3-6*r+r^2)*(yk-wk)/(8*z),

         "maleX" =   1/4 + (yk + wk)*(1-2*r)/8 + (3-5*r+2*r^2)*(yk-wk)/(8*z))
}

######################################################################
# ailRprob:
#
# Probability of recombinant haplotype in AIL
#
# For X chr, we assume balance of A and B (that is, start with male
# F1s being 1/2 from A x B and 1/2 from B x A)
#           
######################################################################
ailRprob <-
function(r, k, what=c("autosome", "femaleX", "maleX"))
1 - 2*hapAAail(r, k, what)


hapAAailXub <-
function(r, maxk)
{
  if(maxk < 2) stop("maxk >= 2")
  res <- matrix(nrow=maxk, ncol=2)
  dimnames(res) <- list(1:maxk, c("femaleAA", "maleAA"))
  res[1,] <- c(1/2, 1)
  res[2,] <- c((1-r)/4 + 1/2, (1-r)/2)

  freqAfem <- 2/3 + 1/3 * (-1/2)^(1:maxk)
  freqAmal <- 2/3 + 1/3 * (-1/2)^(1:maxk-1)

  for(k in 3:maxk) {
    res[k,2] <- res[k-1,1] * (1-r) + r*freqAfem[k-2]*freqAmal[k-2]
    res[k,1] <- res[k-1,2]/2 + res[k-1,1]* (1-r)/2 + r/2 * freqAfem[k-2]*freqAmal[k-2]
  }
  res
}
    
MEailXub <-
function(maxk)
{  
  if(maxk < 2) stop("maxk >= 2")
  derivhap <- hap <- matrix(nrow=maxk, ncol=2)
  dimnames(derivhap) <- list(1:maxk, c("female", "male"))
  hap[1,] <- c(1/2, 1)
  hap[2,] <- c(1/4 + 1/2, 1/2)
  derivhap[1,] <- c(0, 0)
  derivhap[2,] <- c(-1/4, -1/2)

  freqAfem <- 2/3 + 1/3 * (-1/2)^(1:maxk)
  freqAmal <- 2/3 + 1/3 * (-1/2)^(1:maxk-1)
  
  for(k in 3:maxk) {
    hap[k,2] <- hap[k-1,1]
    hap[k,1] <- hap[k-1,2]/2 + hap[k-1,1]/2

    derivhap[k,2] <- -hap[k-1,1] + derivhap[k-1,1] + freqAfem[k-2]*freqAmal[k-2]
    derivhap[k,1] <- derivhap[k-1,2]/2 - hap[k-1,1]/2 + derivhap[k-1,1]/2 + freqAfem[k-2]*freqAmal[k-2]/2
  }

  cbind(-2*derivhap, "overall"= -4/3*derivhap[,1] - 2/3*derivhap[,2])
}

MEailXub2 <-
function(maxk)
{  
  if(maxk < 2) stop("maxk >= 2")
  me <- rep(NA, maxk)
  me[1] <- 0
  me[2] <- 2/3

  freqAfem <- 2/3 + 1/3 * (-1/2)^(1:maxk)
  freqAmal <- 2/3 + 1/3 * (-1/2)^(1:maxk-1)
  
  for(k in 3:maxk) 
    me[k] <- me[k-1] + 4/3*(freqAfem[k-1] - freqAfem[k-2]*freqAmal[k-2])
  me
}

# end of AILprob.R
