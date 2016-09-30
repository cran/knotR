library(knotR)
filename <- "8_1.svg"
a <- reader(filename)

Mver <- matrix(c(
    6,16,
    15,7,
    8,14,
    9,13,
    5,1,
    10,12,
    4,2
),ncol=2,byrow=TRUE)

sym81 <- symmetry_object(a,Mver=Mver,xver=c(3,11))

ou81 <- matrix(c(
    1,14,
    13,2,
    3,12,
    11,4,
    5,10,
    9,6,
    15,8,
    7,16
),ncol=2,byrow=TRUE)

knotplot(symmetrize(a,sym81),ou81,gap=13)

jj <-
  knotoptim(filename,
            symobj = sym81,
            ou   = ou81,
            prob=0,
            iterlim=1000,print.level=2,hessian=FALSE)

write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))
stop() 
