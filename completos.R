setwd("C:/Users/victo/OneDrive/Documentos/specdata")
directorio="C:/Users/victo/OneDrive/Documentos/specdata"

completos<-function(directorio,id=1:332){
    x<-c()
    for(i in id){
        x0<-formatC(i,width=3,flag="0")
        y<-paste(x0,"csv",sep=".")
        tabsinna<-na.omit(read.csv(y))
        contador<-nrow(tabsinna) 
        x<-c(x,contador)
     }
      data.frame(x) 
      `colnames<-`(data.frame(x),"nobs")
}

completos(directorio,1:10)
