#ejemplo pero todos mostrados en un solo vector
set.seed(1)
z <- 5
v <- vector("numeric")
while(z>=3 && z<=10){ #condicion
  v <- c(v,z)
  moneda <- rbinom(1,1,0.5) 
  if(moneda==1){#caminata aleatoria
    z <- z+1
  } else {
    z<- z-1
  }
}
print(v)