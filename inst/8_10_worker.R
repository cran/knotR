library(knotR)
filename <- "8_10.svg"
a <- reader(filename)


sym810 <- symmetry_object(a,Mver=NULL,xver=c(6,11,15))


ou810 <- matrix(c(
    08,01,
    02,09,
    13,03,
    04,14,
    15,05,
    06,11,
    12,07,
    10,13
),ncol=2,byrow=TRUE)

jj <-
  knotoptim(filename,
            symobj = sym810,
            ou   = ou810,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE)


write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

