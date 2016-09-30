library(knotR)
filename <- "8_11.svg"
a <- reader(filename)
sym811 <- symmetry_object(a,Mver=NULL,xver=3)


ou811 <- matrix(c(
    11,02,
    03,10,
    13,04,
    05,14,
    17,06,
    07,16,
    15,08,
    09,12
),ncol=2,byrow=TRUE)

jj <-
  knotoptim(filename,
            symobj = sym811,
            ou   = ou811,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE)


write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

