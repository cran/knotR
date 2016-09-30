setwd("~/packages/rhankin/packages/trunk/knot/inst/")
filename <- "5_2.svg"
ou52 <-
  matrix(c(
      1,5,
      9,2,
      4,10,
      6,13,
      12,7
      ), ncol=2,byrow=TRUE)

jj <- knotoptim(filename,
                Mver = matrix(c(2,3, 8,10, 1,4, 5,13, 12,6, 7,11),ncol=2,byrow=TRUE),
                xver = 9,
                ou   = ou52,
                prob=0.1,
                iterlim=1,print.level=2
                )

write_svg(jj,filename)
stop() 
## This shows how to impose reflectional symmetry on
## 5_2.svg.  It is a sort of figure-of-eight knot.

## First read the inkscape file:
a <- reader(system.file("5_2.svg",package="knot"))
knotplot(a,T,T,T,T,T)
## Now create a symmetry object (look at the knotplot(a) to see the
## nodes that are rotationally related, and also the nodes that are on
## the centreline)



jjM <- 
jjv <- c(9) # nodes on vertical axis

sym52 <- symmetry_object(a, Mver=jjM, xver=jjv)   # Mrot=NULL by default -> assume reflectional symmetry only.


## Function symmetrize_LR() creates a symmetrized knot:
k52 <- symmetrize(as.minobj(a), sym52)

knotplot(k52,T,T,T,T,T,circ=500)  #OK, it looks terrible

mii <- make_minsymvec_from_minobj(k52,sym52)
pii <- make_minobj_from_minsymvec(mii,sym52)



knotplot2(k52,ou52,gap=44)

# now optimize; first define an objective function:

`objective_function` <- function(m){
    badness(make_minobj_from_minsymvec(m,sym52))
}

o <- nlm(objective_function,mii,iterlim=200,print.level=2)

k52_opt <- make_minobj_from_minsymvec(o$estimate,sym52)
stop("intentional stop")

k52_opt <- 
structure(list(handle_A = structure(c(-11.3393050165871, -190.441500389834, 
73.8212257729097, 132.747698103798, -71.5845796251261, 49.7930605111097, 
-116.487895194392, -422.463231224521, -104.958355533674, 226.619073451052, 
493.083855486445, -66.8485050506101, 45.1557791304836, -4.91703642083364, 
232.134515159622, 445.328884644089, 126.086598878823, -47.3872043129962, 
-272.980764315244, -711.246128290781, -104.622132923249, 190.431044861979, 
143.274862461847, -385.178751020074, -564.290174420916, -292.944375382287
), .Dim = c(13L, 2L)), node = structure(c(-72.0435015601927, 
-132.131363081372, 132.131363081372, 72.0435015601927, -58.3701793778049, 
58.3207827808599, -304.785875340418, -324.541152337787, 0, 324.541152337787, 
304.785875340418, -58.3207827808599, 58.3701793778049, 60.5847812289947, 
338.731699901856, 338.731699901856, 60.5847812289947, -170.165789847641, 
-418.63546936808, -548.212439655427, 19.3263647692993, 190.431044861979, 
19.3263647692993, -548.212439655427, -418.63546936808, -170.165789847641
), .Dim = c(13L, 2L))), .Names = c("handle_A", "node"), class = "minobj")


