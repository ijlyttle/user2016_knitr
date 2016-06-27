######################################################################
# DOprob.R
#
# Karl Broman, 13 July 2011
#
# calculations of haplotype probabilities in the diversity outcross
# population
######################################################################

######################################################################
# hapAA8way:
#
# Probability of AA haplotype in pre-CC at G2:Fk
# 
# This assumes that the order of the 8 strains in the cross is random.
#           
######################################################################
hapAA8way <-
function(r, k, what=c("autosome", "femaleX", "maleX"))
{
  what <- match.arg(what)
  if(length(r) > 1) return(sapply(r, hapAA8way, k, what))
  if(r < 0 || r > 1/2) stop("r must be between 0 and 1/2")

  if(what=="autosome" && r==0.5) {
    if(k==0) return(1/16)
    else if(k==1) return(1/32)
    else return(1/64)
  }

  switch(what,
         autosome=
  (1-r)/2*(((1)/(4*(1+6*r))) - (((6*r^2-7*r-3*r*sqrt(4*r^2-12*r+5))/(4*(1+6*r)*sqrt(4*r^2-12*r+5))))*(((1 - 2*r + sqrt(4*r^2-12*r+5))/(4)))^k + (((6*r^2-7*r+3*r*sqrt(4*r^2-12*r+5))/(4*(1+6*r)*sqrt(4*r^2-12*r+5))))*(((1 - 2*r - sqrt(4*r^2-12*r+5))/(4)))^k)

         ,

         femaleX =
( (2-r) * (((1)/(3*(1+4*r))) + ((1)/(6*(1+r)))*(-((1)/(2)))^k - (((4*r^3 - (4*r^2+3*r)*sqrt(r^2-10*r+5)+3*r^2-5*r)/(4*(4*r^2+5*r+1)*sqrt(r^2-10*r+5))))*(((1 - r + sqrt(r^2-10*r+5))/(4)))^k + (((4*r^3 + (4*r^2+3*r)*sqrt(r^2-10*r+5)+3*r^2-5*r)/(4*(4*r^2+5*r+1)*sqrt(r^2-10*r+5))))*(((1 - r - sqrt(r^2-10*r+5))/(4)))^k) +
 (1-r) * (((1)/(3*(1+4*r))) - ((1)/(3*(1+r)))*(-((1)/(2)))^k + (((9*r^2 +5*r + r*sqrt(r^2-10*r+5))/(2*(4*r^2+5*r+1)*sqrt(r^2-10*r+5))))*(((1 - r + sqrt(r^2-10*r+5))/(4)))^k - (((9*r^2 +5*r - r*sqrt(r^2-10*r+5))/(2*(4*r^2+5*r+1)*sqrt(r^2-10*r+5))))*(((1 - r - sqrt(r^2-10*r+5))/(4)))^k) ) / 8

         ,

         maleX=
( (2-r) * (((1)/(3*(1+4*r))) - ((1)/(3*(1+r)))*(-((1)/(2)))^k + (((r^3 - (8*r^3+r^2-3*r)*sqrt(r^2-10*r+5)-10*r^2+5*r)/(2*(4*r^4-35*r^3-29*r^2+15*r+5)))) *(((1 - r + sqrt(r^2-10*r+5))/(4)))^k + (((r^3 + (8*r^3+r^2-3*r)*sqrt(r^2-10*r+5)-10*r^2+5*r)/(2*(4*r^4-35*r^3-29*r^2+15*r+5)))) *(((1 - r - sqrt(r^2-10*r+5))/(4)))^k) +
 (1-r) * (((1)/(3*(1+4*r))) + ((2)/(3*(1+r)))*(-((1)/(2)))^k + (((2*r^4 + (2*r^3-r^2+r)*sqrt(r^2-10*r+5)-19*r^3+5*r)/(4*r^4-35*r^3-29*r^2+15*r+5))) *(((1 - r + sqrt(r^2-10*r+5))/(4)))^k + (((2*r^4 - (2*r^3-r^2+r)*sqrt(r^2-10*r+5)-19*r^3+5*r)/(4*r^4-35*r^3-29*r^2+15*r+5))) *(((1 - r - sqrt(r^2-10*r+5))/(4)))^k) ) / 8       

         )
}

######################################################################
# rikRprob:
#
# Probability of recombinant haplotype in pre-CC at G2:Fk
#
# Again, assuming that the order of the 8 strains in the initial cross 
# is random.
######################################################################
rikRprob <-
function(r, k, what=c("autosome", "femaleX", "maleX"))
{
  if(k < 0) stop("k must be >= 0")
  if(any(r < 0 | r > 1/2)) stop("r must be between 0 and 1/2")

  1-8*hapAA8way(r, k, what)
}

######################################################################
# doRprob:
#
# Probability of recombinant haplotype at generation s in the 
# diversity outcross, assuming a large initial population all of
# pre-CC mice at generation k, and with the order of the 8 strains
# in the initial crosses to form the pre-CC were random and independent 
#
# s = generation of DO
#
# At s=1 (first DO generation), each individual is cross between
# two random pre-CC individuals at generation G2:Fk
######################################################################
doRprob <-
function(r, k, s, what=c("autosome", "femaleX", "maleX"))
{
  if(any(k < 0)) stop("k must be >= 0")
  if(s < 1) stop("s must be >= 1")
  if(any(r < 0 | r > 1/2)) stop("r must be between 0 and 1/2")
  
  what <- match.arg(what)
  if(what=="femaleX" || what=="maleX") {
    z <- sqrt((1-r)*(9-r))
    ws <- ((1-r+z)/4)^(s-1)
    ys <- ((1-r-z)/4)^(s-1)

    malehapprob <- hapAA8way(r, k[1]+1, "male")
    femalehapprob <- hapAA8way(r, k[1]+1, "female")
    if(length(k) > 1) {
      for(j in 2:length(k)) {
        malehapprob <- malehapprob + hapAA8way(r, k[j]+1, "male")
        femalehapprob <- femalehapprob + hapAA8way(r, k[j]+1, "female")
      }
      malehapprob <- malehapprob/length(k)
      femalehapprob <- femalehapprob/length(k)
    }
  }
  else {
    happrob <- hapAA8way(r, k[1]+1, what)
    if(length(k) > 1) {
      for(j in 2:length(k)) {
        happrob <- happrob + hapAA8way(r, k[j]+1, what)
      }
      happrob <- happrob/length(k)
    }
  }

  switch(what,
         autosome= 1-8*((1-r)^(s-1)*(happrob - 1/64) + 1/64),

         femaleX=  1-8*(1/64 + 1/128 * ((128*malehapprob + 64*femalehapprob*(1-r) - (3-r))*(ws-ys)/z -
                                        (1-64*femalehapprob)*(ws+ys))),

         maleX =   1-8*(1/64 + 1/128 * ((64*malehapprob - 256*femalehapprob + 3) * (ys-ws)*(1-r)/z -
                                        (1-64*malehapprob)*(ws+ys)))
         )
}

# HS probabilities, Pr(a1|a2) along single haplotype, from Mott et al (2000)
hsprobMott <- 
function(r, g)
{
  m <- exp(-g*imf.h(r)/100)
  cbind(m + (1-m)/8, (1-m)/8)
}

# end of DOprob.R


