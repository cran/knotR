library(knotR)
filename <- "8_20.svg"
a <- reader(filename)

sym820 <- symmetry_object(a,Mver=NULL,xver=c(2,4))

ou820 <- matrix(c(
    09,14,
    05,10,
    11,02,
    07,11,
    13,07,
    03,14,
    14,04,
    01,06
),ncol=2,byrow=TRUE)

jj <-
  knotoptim(filename,
            symobj = sym820,
            ou   = ou820,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE)


write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

