library(knotR)
setwd("~/packages/rhankin/packages/trunk/knot/inst/")
filename <- "5_1.svg"
jj <- knotoptim(filename,
                Mver = matrix(c(11,13), byrow=TRUE,ncol=2),
                xver = c(2,12),
                Mrot = rbind(c(12,4,16,8,20),c(13,5,17,9,1),c(11,3,15,7,19),c(2,14,6,18,10)),
                ou   = matrix(c(2,11,14,3,6,15,18,7,10,19),ncol=2,byrow=TRUE),
                prob=0,
                control=list(trace=100,maxit=4000), # these arguments for optim()
                useNLM=FALSE
                )


write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))
