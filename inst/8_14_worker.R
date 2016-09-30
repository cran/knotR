library(knotR)
filename <- "8_14.svg"
a <- reader(filename)
sym814 <- symmetry_object(a,Mver=NULL,xver=13)

ou814 <- matrix(c(
    13,01,
    02,12,
    15,03,
    04,10,
    09,06,
    07,16,
    16,08,
    11,14
),ncol=2,byrow=TRUE)

jj <-
  knotoptim(filename,
            symobj = sym814,
            ou   = ou814,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE)


write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

