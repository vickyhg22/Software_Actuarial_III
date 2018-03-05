#1 creo el objeto
mtcars <- data.frame(a=1, b="a")
#2 estudio la manera en la que se guardará
dput(mtcars)
#3 lo guardo en el disco duro
dput(mtcars,file="\Users\victo\OneDrive\Documentos\GitHub\Software_Actuarial_III\mtcars.R")
#4 genero un nuevo objeto a partir de la informacion guardada
CarrosAnaVictoria <- dget(file="\Users\victo\OneDrive\Documentos\GitHub\Software_Actuarial_III\mtcars.R")