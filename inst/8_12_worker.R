library(knotR)
filename <- "8_12.svg"
a <- reader(filename)
sym812 <- symmetry_object(a,Mver=NULL,xver=8)



ou812 <- matrix(c(
    14,02,
    03,12,
    09,04,
    05,08,
    18,06,
    07,17,
    16,10,
    11,15
),ncol=2,byrow=TRUE)

jj <-
  knotoptim(filename,
            symobj = sym812,
            ou   = ou812,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE)


write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

