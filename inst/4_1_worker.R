library(knotR)
setwd("~/packages/rhankin/packages/trunk/knot/inst/")
filename <- "4_1.svg"
jj <- knotoptim(filename,
                Mver = rbind(c(2,3),c(9,7),c(10,6), c(1,4),c(5,11)),
                xver = 8,   # node on vertical axis
                ou   = rbind( c(1,5), c(9,2), c(4,8),c(6,11)),
                prob=0,
#                iterlim=100, print.level=2)
                control=list(trace=100,maxit=1000), # these arguments for optim()
                useNLM=FALSE
                )

write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))
