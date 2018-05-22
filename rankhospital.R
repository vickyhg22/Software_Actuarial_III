setwd("C:/Users/victo/OneDrive/Documentos/Calidad de Hospitales - data")
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 

rankhospital <- function(estado, resultado,num) {
    
    if (resultado == "ataque"){
        tablanueva <- data.frame(Numero = outcome$Provider.Number, Nombre = outcome$Hospital.Name, estado= outcome$State, resultado = outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
        resul = "Hospital.30-Day.Death.(Mortality).Rates.from.Heart.Attack"
        tablanueva[tablanueva == "Not Available"] <- NA
        #ir a la columna de ataque al corazon (13)  11 
    } else if (resultado == "falla") {
        tablanueva <- data.frame(Numero = outcome$Provider.Number, Nombre = outcome$Hospital.Name, estado= outcome$State, resultado = outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
        resul = "Hospital.30-Day.Death.(Mortality).Rates.from.Heart.Failure"
        tablanueva[tablanueva == "Not Available"] <- NA
        #ir a la columna de falla cardiaca   19    17  
    } else if (resultado=="neumonia"){
        tablanueva <- data.frame(Numero = outcome$Provider.Number, Nombre = outcome$Hospital.Name, estado= outcome$State, resultado = outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
        resul = "Hospital.30-Day.Death.(Mortality).Rates.from.Pneumonia"
        tablanueva[tablanueva == "Not Available"] <- NA
        #ir a la columna de neumonia 25      23   
    }
    
    
    
    tablanueva2 <- data.frame(Numero = outcome$Provider.Number , Nombre = outcome$Hospital.Name)
    est <- estado
    numero <- num
    tabsinna <- na.omit(tablanueva)
    p <- tabsinna[ tabsinna$estado == est, ]
    p$estado <- NULL
    #x <- x[order(p$Nombre),]  
    numerico <- as.numeric(as.character(p$resultado))
    #x <- x[order(numerico),] 
    ordenado <- p[order(numerico),]
    q <- row.names(x) 
    listanum <- as.list.numeric_version(q)
    contador <- length(listanum)
    
    if (!any(estado == state.abb)){
        stop("estado inválido")
    }
    if (!any(resultado == c("ataque", "falla", "neumonia"))){
        stop("resultado inválido")
    } 
    if (!any(num == c("mejor","peor",1:contador))) {
        stop("num inválido")
    }
    
    #if (contador < numero){
     #   print("NA")
   # } else {
     conorden <- data.frame(q, numero = (c(1:contador)))

    if (numero == "mejor") {
        posi <- conorden[1,]
    } else if (numero == "peor") {
        posi <- conorden[contador, ]
    } else  { 
        posi <- conorden[numero, ]
    }
    gi <- posi[1,1]
    numfinal <- as.numeric(as.character(gi))
    valor <- tablanueva2[numfinal,2]
    print(as.character(valor))   
  #  }
    
}   
 #falta ordenar alfabeticamente, que num no sea mayor y poner "NA" sin comillas

rankhospital("MD", "ataque", 5) 