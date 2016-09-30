library(knotR)
filename <- "8_13.svg"
a <- reader(filename)
sym813 <- symmetry_object(a,Mver=NULL,xver=14)

ou813 <- matrix(c(
    09,01,
    02,13,
    08,03,
    04,12,
    11,05,
    06,10,
    13,07,
    14,09
),ncol=2,byrow=TRUE)

jj <-
  knotoptim(filename,
            symobj = sym813,
            ou   = ou813,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE)


write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

