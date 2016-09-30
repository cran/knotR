library(knotR)
setwd("~/packages/rhankin/packages/trunk/knot/inst/")
filename <- "6_1.svg"

Mver <-   matrix(c(
    04,03,
    10,12,
    09,13,
    05,02,
    08,14,
    06,01,
    15,07
),ncol=2,byrow=TRUE)

ou61 <- matrix(c(
    07,01,
    02,14,
    12,03,
    05,11,
    09,06,
    15,08
),byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                Mver = Mver,
                xver = 11,
                ou   = ou61,
                prob=0,
                ## iterlim=1,print.level=2,         # these arguments for nlm()
                control=list(trace=100,maxit=1000), # these arguments for optim()
                useNLM=FALSE
                )
write_svg(jj,filename)
