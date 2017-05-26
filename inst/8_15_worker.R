library(knotR)
filename <- "8_15.svg"
a <- reader(filename)
Mver <- matrix(c(
    04,16,
    15,05,
    09,11,
    06,14,
    08,12,
    03,01,
    07,13
),ncol=2,byrow=TRUE)

sym815 <- symmetry_object(a,Mver=Mver,xver=c(2,10))


ou815 <- matrix(c(
    16,05,
    12,01,
    02,14,
    07,03,
    04,09,
    06,15,
    10,07,
    14,11
),ncol=2,byrow=TRUE)

jj <-
  knotoptim(filename,
            symobj = sym815,
            ou   = ou815,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE
#                control=list(trace=100,maxit=30000), # these arguments for optim()
#                useNLM=FALSE
)


write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

