library(knotR)
filename <- "8_14.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

sym814 <- symmetry_object(a,Mver=NULL,xver=20)
a <- symmetrize(a,sym814)
#knotplot2(a,text=T,lwd=1,rain=T,circ=F)


ou814 <- matrix(c(
    17,22,
    05,14,
    13,08,
    24,10,
    09,24,
    23,04,
    03,18,
    19,02
),ncol=2,byrow=TRUE)

#knotplot(a,ou814)

jj <-
  knotoptim(filename,
            symobj = sym814,
            ou   = ou814,
            prob = 0,
            iterlim=1000,print.level=2,hessian=FALSE
#                control=list(trace=100,maxit=5000), # these arguments for optim()
#                useNLM=FALSE
)


write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

