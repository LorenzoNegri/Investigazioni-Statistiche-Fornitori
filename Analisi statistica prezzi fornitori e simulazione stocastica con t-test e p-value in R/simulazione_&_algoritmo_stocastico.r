
##################################################################
# Simulazione e algoritmo stocastico
##################################################################

my.data <- read.csv("vanAllC.csv", sep=",") # carico file csv

data1 <- my.data$price.mo[my.data$vendor==unique(my.data$vendor)[1]] 
data2 <- my.data$price.mo[my.data$vendor==unique(my.data$vendor)[2]]

# conservo in n1 e n2 il numero di osservazioni per fornitore
n1 = length(data1); n2 = length(data2)

# inserisco in v1 e v2 il nome del fornitore
v1 = unique(my.data$vendor)[1]; v2 = unique(my.data$vendor)[2]

testResult <- t.test(data1,data2) # il t.test con i parametri di default è sufficiente
testResult

# l'algoritmo stocastico della simulazione
set.seed(1234)
my.new.data <- my.data
my.new.data$vendor <- v2 # ricordo che v2 = "VB"
index.temp <- sample(1:datarws,n1)  
my.new.data$vendor[index.temp] <- v1 # ricordo che v1 = "VA"
new.data1 <- my.new.data$price.mo[my.new.data$vendor==v1]
new.data2 <- my.new.data$price.mo[my.new.data$vendor==v2]
t.test(new.data1,new.data2)$statistic

# funzione della simulazione
set.seed(554)
my.new.data <- my.data
doone = function(){
    my.new.data$vendor = v2
    index.temp = sample(1:datarws, n1)  
    my.new.data$vendor[index.temp] = v1
    new.data1 = my.new.data$price.mo[my.new.data$vendor==v1]
    new.data2 = my.new.data$price.mo[my.new.data$vendor==v2]
    t.val = t.test(new.data1, new.data2)$statistic
    as.numeric(t.val)
}

# simulazione, calcolo p-value
my.t.values <- replicate(100000, doone())
lt.ut <- 0
for (i in my.t.values){
    ifelse(
        i<as.numeric(testResult[1]) | i>abs(as.numeric(testResult[1])), 
        lt.ut <- lt.ut+1, 
        lt.ut
    )
}
pvs <- (lt.ut)/100000

# visualizzazione risultati e distribuzione t
cat("p-value calcolato dalla simulazione: ", pvs)
options(repr.plot.width=4, repr.plot.height=4)
hist(my.t.values, prob=T)
curve(dnorm(x, mean=mean(my.t.values), sd=sd(my.t.values)), , col="red", add=TRUE)
