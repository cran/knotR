library(knotR)
filename <- "8_16.svg"
a <- reader(filename)
Mver <- matrix(c(
    04,14,
    13,05,
    08,10,
    12,06,
    03,01,
    07,11
),ncol=2,byrow=TRUE)

sym816 <- symmetry_object(a,Mver=Mver,xver=c(2,9))


ou816 <- matrix(c(
    14,05,
    10,01,
    02,12,
    07,03,
    04,09,
    06,10,
    12,07,
    09,13
),ncol=2,byrow=TRUE)

jj <-
  knotoptim(filename,
            symobj = sym816,
            ou   = ou816,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE)


write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

