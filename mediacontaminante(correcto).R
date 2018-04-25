setwd("C:/Users/victo/OneDrive/Documentos/specdata")
directorio="C:/Users/victo/OneDrive/Documentos/specdata"

mediacontaminante <- function(directorio, contaminante, id = 1:332) {
    if (contaminante == "nitrate"){
        conta = "nitrate"
    } else if (contaminante == "sulfate") {
        conta = "sulfate"
    }
    w <- vector("numeric")
    for (i in id ){
        u <- formatC(i,width=3,flag="0")
        t <- paste(u,"csv",sep=".")
        d  <- subset(read.csv(t), T, select = c(conta) )  
        d
        tabsinna <- na.omit(d)
        g <- data.matrix(tabsinna)
        result.mean <- mean(g, na.rm = TRUE)
        w <- c(w,result.mean)
        mediatodo <- mean(w,na.rm=TRUE)
    }
    print(w)
    print(mediatodo)
}

mediacontaminante(directorio,"sulfate",1:332)
