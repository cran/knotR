library(knotR)
filename <- "8_5.svg"
a <- reader(filename)

Mver <- matrix(c(
    09,07,
    15,01,
    03,13,
    04,12,
    14,02,
    10,06,
    05,11
),ncol=2,byrow=TRUE)

sym85 <- symmetry_object(a,Mver=Mver,xver=c(8,16))

ou85 <- matrix(c(
    08,01,
    02,13,
    14,03,
    04,15,
    10,05,
    06,11,
    12,07,
    16,09
),ncol=2,byrow=TRUE)

jj <-
  knotoptim(filename,
            symobj = sym85,
            ou   = ou85,
            prob=0,
#            iterlim=1000,print.level=2,hessian=FALSE

            control=list(trace=100,maxit=2000), # these arguments for optim()
            useNLM=FALSE
            )

write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))


