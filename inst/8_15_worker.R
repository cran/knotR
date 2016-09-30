library(knotR)
filename <- "8_15.svg"
a <- reader(filename)
Mver <- matrix(c(
    04,16,
    15,05,
    09,11,
    06,14,
    08,12,
    03,01,
    07,13
),ncol=2,byrow=TRUE)

sym815 <- symmetry_object(a,Mver=Mver,xver=c(2,10))


ou815 <- matrix(c(
    16,5,
    12,1,
    2,14,
    7,3,
    4,9,
    6,15,
    10,7,
    14,11
),ncol=2,byrow=TRUE)
jj <-
  knotoptim(filename,
            symobj = sym815,
            ou   = ou815,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE)


write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

