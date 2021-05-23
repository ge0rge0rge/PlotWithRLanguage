#sign test
muRange <- seq(51,55, 0.02)
n <- 20
N <- 100000
mu0 <- 53.0

powerT <- vector()
powerU <- vector()

for(muActual in muRange){
  rejectT <- 0
  rejectU <- 0
  
  for(j in 1:N){
    data <- rnorm(n, mean=muActual, sd=1.2)
    test <- t.test(data, mu=mu0)
    pValT = test$p.value
    xPosition <- sum(data>mu0)
    uStat <- max(xPosition,n-xPosition)
    pValSign <- 2*dbinom(uStat,n,0.5)
    
    if(pValT<0.05){
    rejectT = rejectT + 1
    }
    if(pValSign<0.05){
    rejectU = rejectU + 1
    }
  }
  a=rejectT/N
  b=rejectU/N
  powerT <- append(powerT,a)
  powerU <- append(powerU,b)
}

plot(muRange,powerT,ylab="",type="l",col="black")
par(new=TRUE)
plot(muRange,powerU,ylab="",type="l",col="red")
legend("topright", c("t test","sign test"), col=c("black","red"),
       lty = c(1), text.col=c("black","red"),text.font = 4)


