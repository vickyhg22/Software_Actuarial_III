setwd("C:/Users/victo/OneDrive/Documentos/specdata")
directorio="C:/Users/victo/OneDrive/Documentos/specdata"

completos <- function(directorio, id = 1:332) {
    nobs<-vector()
    for (i in id ){
    u<-formatC(i,width=3,flag="0")
    t<-paste(u,"csv",sep=".")
    tabsinna<- (read.csv(t))
    casoscompletos <- directorio[complete.cases(tabsinna)]
    p <- length(casoscompletos) 
   # print(p)
    nobs <- c(nobs,p)
    }
    #print(w)cb
    tabla <- data.frame(nobs)
    print(tabla)
    
}
completos(directorio,1:332)