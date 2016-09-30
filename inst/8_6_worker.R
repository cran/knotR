library(knotR)
filename <- "8_6.svg"
a <- reader(filename)


Mver <- matrix(c(
    18,19,
    10,08,
    17,01,
    02,16,
    15,03,
    11,07,
    04,14,
    12,06,
    05,13
),ncol=2,byrow=TRUE)

sym86 <- symmetry_object(a,Mver=Mver,xver=9)

ou86 <- matrix(c(
    09,01,
    02,17,
    16,03,
    04,15,
    12,05,
    06,13,
    14,07,
    18,10
),ncol=2,byrow=TRUE)

jj <-
  knotoptim(filename,
            symobj = sym86,
            ou   = ou86,
            prob = 0,
#            iterlim=1000,print.level=2,hessian=FALSE
            control=list(trace=100,maxit=2000), # these arguments for optim()
            useNLM=FALSE
)

write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

