setwd("C:/Users/victo/OneDrive/Documentos/Calidad de Hospitales - data")
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 

mejor <- function(estado, resultado) {
    if (resultado == "ataque"){
        tablanueva <- data.frame(Nombre = outcome$Hospital.Name, estado= outcome$State, resultado = outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
        resul = "Hospital.30-Day.Death.(Mortality).Rates.from.Heart.Attack"
        tablanueva[tablanueva == "Not Available"] <- NA
        #ir a la columna de ataque al corazon (13)  11 
    } else if (resultado == "falla") {
        tablanueva <- data.frame(Nombre = outcome$Hospital.Name, estado= outcome$State, resultado = outcome$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
        resul = "Hospital.30-Day.Death.(Mortality).Rates.from.Heart.Failure"
        tablanueva[tablanueva == "Not Available"] <- NA
        #ir a la columna de falla cardiaca   19    17  
    } else if (resultado=="neumonia"){
        tablanueva <- data.frame(Nombre = outcome$Hospital.Name, estado= outcome$State, resultado = outcome$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
        resul = "Hospital.30-Day.Death.(Mortality).Rates.from.Pneumonia"
        tablanueva[tablanueva == "Not Available"] <- NA
        #ir a la columna de neumonia 25      23   
    }
    
    if (!any(estado == state.abb)){
        stop("estado inválido")
    }
    if (!any(resultado == c("ataque", "falla", "neumonia"))){
        stop("resultado inválido")
    }
    
    est <- estado
    tabsinna <- na.omit(tablanueva)
    p <- tabsinna[ tabsinna$estado == est, ]
    p[1:2] <- NULL
    bla <- data.frame(p)
    a <- apply(bla,1, min)
    mini <- which.min(a)
    ya <- p[mini,1]
    ya2 <- tabsinna[ tabsinna$estado == est, ]
    ya3 <- ya2[ ya2$resultado == ya, ]
    resu <- ya3[1 , 1]
    final <- as.character(resu)
    print(final)
}


mejor("AR", "falla")   

 
 