#PDF of Normal distribution
x <- seq(-5,10,length.out = 1000)
y <- dnorm(x,0,1)

#transfer to expression
deri <- expression(dnorm(x,0,1))

#generate first derivative in "call" type
dy <- D(deri,"x")

#generate second derivative in "call" type
ddy <- D(D(deri,"x"),"x")

plot(x, y, type = "l", col="black",lwd=2, xlim = c(-4,4), ylim=c(-0.5,0.5))
par(new=TRUE)
plot(x, eval(dy), ylab="",type = "l", col="green", lwd=2, xlim = c(-4,4), ylim=c(-0.5,0.5))
par(new=TRUE)
plot(x, eval(ddy), ylab="", type = "l", col="blue", lwd=2, xlim = c(-4,4), ylim=c(-0.5,0.5))
legend("topright", c("X~N(0,1)","First Derivatives","Second Derivatives"), col=c("black","green","blue"),
       lty = c(1), text.col=c("black","green","blue"),text.font = 4)

