library(knotR)
filename <- "8_4.svg"
a <- reader(filename)


sym84 <- symmetry_object(a,xver=4)


ou84 <- matrix(c(
    13,19,
    02,10,
    11,03,
    04,12,
    18,05,
    06,17,
    16,07,
    08,15
),ncol=2,byrow=TRUE)



jj <-
  knotoptim(filename,
            symobj = sym84,
            ou   = ou84,
            prob = 0,
#            iterlim=1000,print.level=2,hessian=FALSE

            control=list(trace=100,maxit=2000), # these arguments for optim()
            useNLM=FALSE


            )

write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

