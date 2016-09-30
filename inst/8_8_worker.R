library(knotR)
filename <- "8_8.svg"
a <- reader(filename)
sym88 <- symmetry_object(a,Mver=NULL,xver=8)

ou88 <- matrix(c(
    05,01,
    02,04,
    09,03,
    04,10,
    15,06,
    07,12,
    13,08,
    11,14
),ncol=2,byrow=TRUE)

knotplot(symmetrize(a,sym88),ou88)


jj <-
  knotoptim(filename,
            symobj = sym88,
            ou   = ou88,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE)


write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

