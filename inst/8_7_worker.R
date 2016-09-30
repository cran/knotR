library(knotR)
filename <- "8_7.svg"
a <- reader(filename)

sym87 <- symmetry_object(a,Mver=NULL,xver=5)

ou87 <- matrix(c(
    08,01,
    02,09,
    18,03,
    04,11,
    13,05,
    06,14,
    16,07,
    10,17
),ncol=2,byrow=TRUE)

knotplot(symmetrize(a,sym87),ou87)

jj <-
  knotoptim(filename,
            symobj = sym87,
            ou   = ou87,
            prob = 0,
#            iterlim=1000,print.level=2,hessian=FALSE
            control=list(trace=100,maxit=2000), # these arguments for optim()
            useNLM=FALSE
            )


write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

