#Aqui se está realizando una asignacion
x <- 1
x <- 2

#La asignacion no me permitio visualizar el resultado, para ello debo solicitar una impresion
print(x)

#Al poner mayúscula, que no ha sido definida, em marcará error
print(X)

#la alternativa es solicitar una impresión implicita
x

#la asignacion puede hacerse tambien de textos
msg <- "hola"

#al solicitar una impresióm, me debera enseñar el mensaje que estaba en msg 
print(msg)

x <- #expresion incompleta, para salir de ella (dejar de ejecutarla) se da esc
3

#impresion de un arreglo
x <- 1:20
print(x)

y <- 3:9
y

z <- 99:43
z
#el operador ":" me permite generar secuencias numericas de un principio a un fin 
w <- 3:14.5
w
#en el caso de trabajar con decimales me genera secuencias numericas hasta el entero

#R nos permite trabajar con conceptos matematicos superiores como los complejos
inf
1/0
#es posible hacer algunas operaciones con este valor
exp(inf) #0
inf + inf #inf
inf * inf # inf
inf - inf #NAN (Not a number)
inf/inf #NAN

#cada objeto tiene sus propiedades o  atributos los cuales se pueden accesar con al funcion:
attributes(z)

#es posible crear un vector con la funcion c()
x <- c(TRUE,FALSE,TRUE,TRUE,F,F,T) #LOGICAL
x <- c(1L, 3L, 5L, -4L)            #INTEGER
x <- c(1, 3, 5, -4)                #numeric
x <- c(1, 3, 5, -4, 3.141692654)   #numeric
x <- c(1+1i,3+4i,-5-6i,3+4i)       #complex
x <- c("a", "b", "c")              #character

#otro posible camino seria con la funcion vector
x <- vector("numeric", length = 10)
x #el vector se creo vacío

#coercion (automatico cambia valores para que se vuelvan de una clase en particular)
y <- c(1.7, "a")       #CHARACTER
y <- c(TRUE, 2)        #numeric
y <- c(TRUE, 2L)       #INTEGER
y <- c(FALSE,2L, 5, 5+4i) #complex

#coercion forzada: que un objeto se vuelva del tipo que yo quiero, se ocupa "as.(clase)"
x <- 0:6          #integer
as.numeric(x)     #numeric
as.logical(x)     #logical -los 0 se vuelven false y lo demas true
as.character(x)   #character . todo es texto

#errores en la coercion forzada
x <- c("a", "b", "c")
as.numeric(x)  
as.logical(x)
as.complex(x)
#apareceran NA porque esta coercion no es posible y genera un valor faltante

#valor de dominancia: character-complex-numeric-integer-logical