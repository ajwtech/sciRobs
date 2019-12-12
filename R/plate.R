
library(rgl)
options(rgl.printRglwidget = FALSE)

open3d()  
bg3d("white")


tx <- c(0, 0, 24, 24)
ty <- c(0, 16, 16, 0)
shade3d(addNormals(translate3d(extrude3d(tx, ty, thickness = -1.5),0,0,-2.01)), col = 'white', alpha = .95 )
l0 <- oh3d( color = "white")
root <- currentSubscene3d()
wells <- 1:96
samples <- 1:96
n <- 1
x <- seq(1,24,2)
y <- seq(1,16,2)
plate <- sapply(y, function(y){
    sapply(x, function(x){
      wells[n] <<- shade3d( addNormals(translate3d( l0, x, y, 0)),alpha = .95)
      samples[n] <<- shade3d(addNormals(cylinder3d(cbind(x:x,y:y,-2:1), radius = .25, closed = -1, sides = 30)),alpha = .5,color = "blue")
      n <<- n+1
    })
    
  })
# s<- scene3d()
# rgl.close()
