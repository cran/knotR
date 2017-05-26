library(knotR)
filename <- "8_20.svg"
a <- reader(filename)
#knotplot2(a,node=T)

sym820 <- symmetry_object(a,Mver=NULL,xver=18)
a <- symmetrize(a,sym820)
#knotplot2(a,lwd=1,text=TRUE,circ=FALSE,rainbow=TRUE)



ou820 <- matrix(c(
    02,08,
    16,03,
    04,21,
    22,07,
    07,15,
    10,17,
    20,11,
    15,22
),ncol=2,byrow=TRUE)

#knotplot(a,ou820)


jj <-
  knotoptim(filename,
            symobj = sym820,
            ou   = ou820,
            prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
            )


write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
