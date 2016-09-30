library(knotR)
filename <- "8_17.svg"
a <- reader(filename)
Mver <- NULL

sym817 <- symmetry_object(a,Mver=Mver,xver=3)

ou817 <- matrix(c(
    11,06, 
    07,13,
    14,09,
    10,04,
    02,11,
    13,03,
    04,14,
    05,01
),ncol=2,byrow=TRUE)

jj <-
  knotoptim(filename,
            symobj = sym817,
            ou   = ou817,
            prob = 0.1,
            iterlim=1000,print.level=2,hessian=FALSE)


write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

