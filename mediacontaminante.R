setwd("C:/Users/victo/OneDrive/Documentos/specdata")
directorio="C:/Users/victo/OneDrive/Documentos/specdata"

mediacontaminante <- function(directorio, contaminante = "nitrate", id = 1:332){
    if (contaminante == "nitrate"){
    columna = 3
    } else if (contaminante == "sulfate") {
    columna = 2
    }
    
contador<-0
suma<-0
for (a in id){
    b<-formatC(a,width = 3,flag="0")
    y <-paste(b,"csv",sep=".")
    tabsinna<-read.csv(y)
    suma<-sum(tabsinna[,columna],na.rm=TRUE) + suma
    contador<-length(na.omit(tabsinna[,columna])) + contador
}
 z <- suma/contador
 z 
}

mediacontaminante(directorio,"nitrate",1:332)
