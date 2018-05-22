setwd("C:/Users/victo/OneDrive/Documentos/Calidad de Hospitales - data")

rankingcompleto <- function(resultado, num = "mejor") {
   outcome1 <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 
   estados <- unique(outcome1[, 7])
   if (resultado == "ataque"){
       tablanueva <- data.frame(Numero = outcome$Provider.Number, Nombre = outcome$Hospital.Name, estado= outcome$State, resultado = outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
       resul =  outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
       tablanueva[tablanueva == "Not Available"] <- NA
       col = 11
   } else if (resultado == "falla") {
       tablanueva <- data.frame(Numero = outcome$Provider.Number, Nombre = outcome$Hospital.Name, estado= outcome$State, resultado = outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
       resul = outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
       tablanueva[tablanueva == "Not Available"] <- NA
       col = 17
   } else if (resultado=="neumonia"){
       tablanueva <- data.frame(Numero = outcome$Provider.Number, Nombre = outcome$Hospital.Name, estado= outcome$State, resultado = outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
       resul = outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
       tablanueva[tablanueva == "Not Available"] <- NA
       col = 23
   }
outcome1[,col] <- as.numeric(outcome1[, col])
outcome1 <- outcome1[, c(2, 7, col)]  
outcome1 <- na.omit(outcome1)
nrank <- function(state) {
b = outcome1[outcome1[, 2] == state, ]
contador = nrow(b) 
   switch(num, mejor= {
   num = 1
   }, peor = {
   num = contador
   })
   if (num > contador) {
   resultado1 = NA
   }
   o <- order(b[, 3], b[, 1])
   resultado1 <- b[o, ][num, 1]
   c(resultado1, state)
   }
 if (!any(resultado == c("ataque", "falla", "neumonia"))){
 stop("resultado inválido")
 } 
ya <- do.call(rbind, lapply(estados, nrank))
ya <- ya[order(ya[, 2]), ]
rownames(ya) <- ya[, 2]
colnames(ya) <- c("hospital", "estados")
data.frame(ya) 
} 

tail(rankingcompleto("falla"), 10)  