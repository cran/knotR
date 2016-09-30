library(knotR)
filename <- "8_21.svg"
a <- reader(filename)
sym821 <- symmetry_object(a,Mver=NULL,xver=12)


ou821 <- matrix(c(
    7,1,
    2,8,
    9,4,
    5,14,
    11,6,
    9,12,
    13,9,
    14,11
),ncol=2,byrow=TRUE)


jj <-
  knotoptim(filename,
            symobj = sym821,
            ou   = ou821,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE)


write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

