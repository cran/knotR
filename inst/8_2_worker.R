library(knotR)
filename <- "8_2.svg"
a <- reader(filename)

Mver <- matrix(c(
    9,7,
    15,1,
    2,14,
    10,6,
    3,13,
    4,12,
    11,5
),ncol=2,byrow=TRUE)

sym82 <- symmetry_object(a,Mver=Mver,xver=c(8,16))

ou82 <- matrix(c(
    8,1,
    2,15,
    10,3,
    4,11,
    12,5,
    6,13,
    14,7,
    16,9
),ncol=2,byrow=TRUE)


jj <-
  knotoptim(filename,
            symobj = sym82,
            ou   = ou82,
            prob=0,
            iterlim=1000,print.level=2,hessian=FALSE)

write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))
stop() 
