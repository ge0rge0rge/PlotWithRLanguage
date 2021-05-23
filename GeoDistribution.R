p <- 18/37
N <- 10^6


rouletteSpins <- function(p) {
  x <- 1
  while (1) {
    x<-x+1
    if (runif(1,min=0,max = 1)<p){
      return(x)
      break
    } 
  }  
}



py<-c(0,0,0,0,0,0,0)

for (x in 1:N){
  temp<-rouletteSpins(p)
  if (temp <8) {
    py[temp-1] <-py[temp-1]+ 1.0
  }
}

for (y in 0:6){
  py[y]<-py[y]/N
                        
}

x <- seq(from=1, by=1,length=7) 
plot(x,py,xlim=c(1,7), type="h", ylim=c(0,0.5), lwd="10",xlab='Figure 1: A geometric PMF
',  ylab='Probability',col="blue")
par(new=TRUE)

px <- dgeom(0:6, p)
plot(x,px,xlim=c(1,7), type="h", ylim=c(0,0.5),lwd="3",xlab='Figure 1: A geometric PMF
',  ylab='Probability', col="yellow")
