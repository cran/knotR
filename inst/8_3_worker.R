library(knotR)
filename <- "8_3.svg"
a <- reader(filename)

Mver <- matrix(c(
    06,18,
    17,07,
    08,16,
    05,01,
    15,09,
    10,14,
    11,13,
    04,02
),ncol=2,byrow=TRUE)

sym83 <- symmetry_object(a,Mver=Mver,xver=c(3,12))


ou83 <- matrix(c(
    07,18,
    02,14,
    13,03,
    04,12,
    11,05,
    17,08,
    09,16,
    15,10
),ncol=2,byrow=TRUE)

jj <-
  knotoptim(filename,
            symobj = sym83,
            ou   = ou83,
            prob= 0,
            iterlim=1000,print.level=2,hessian=FALSE)

write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

