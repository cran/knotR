library(knotR)

filename <- "9_36.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)


ou936 <- matrix(c(  # alternating  
    1,25,
    23,2,
    11,22,
    19,9,
    26,19,
    18,28,
    8,16,
    15,5,
    4,12
), byrow=TRUE,ncol=2)



sym936 <- symmetry_object(a,xver=9)
a <- symmetrize(a,sym936)
##knotplot2(a)
##knotplot2(a,lwd=1,text=TRUE,circ=FALSE,rain=TRUE)
##knotplot(a,ou936)



jj <- knotoptim(filename,
                symobj=sym936,
                ou   = ou936,
                prob=0,
#                iterlim=10000, print.level=2
                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))
