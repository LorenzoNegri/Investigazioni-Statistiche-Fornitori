
##################################################################
# t-test vanAllC
##################################################################

my.data <- read.csv("vanAllC.csv", sep=",") # carico file csv

data1 <- my.data$price.mo[my.data$vendor==unique(my.data$vendor)[1]] 
data2 <- my.data$price.mo[my.data$vendor==unique(my.data$vendor)[2]]

# inserisco in v1 e v2 il nome del fornitore
v1 = unique(my.data$vendor)[1]; v2 = unique(my.data$vendor)[2]

testResult <- t.test(data1,data2) # il t.test con i parametri di default è sufficiente
testResult

# creiamo un histogram density plot dei prezzi per il fornitore VA 
# e uno per il fornitore VB così da poterli confrontare per frequenza
par(mfrow=c(2,3))
plot(density(data1), main="confronto frequenza prezzi", xlab="prezzo al kg", bty="n", lwd=2)
lines(density(data2), col="red", lty=2, lwd=2)
legend("topright", c(paste(v1),paste(v2)), title="Fornitore", cex = 1, y.intersp=2,
   col=c("black","red"), lty=1:2, lwd=2, bty="n") 

plot(density(data1), main=paste("fornitore", v1), bty="n")
plot(density(data2), main=paste("fornitore", v2), bty="n")


