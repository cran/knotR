library(knotR)
filename <- "8_16.svg"
a <- reader(filename)
#knotplot2(a,node=TRUE)

Mver <- matrix(c(
    07,01,
    08,22,
    09,21,
    20,10,
    14,16,
    19,11,
    06,02,
    13,17,
    12,18,
    05,03
),ncol=2,byrow=TRUE)

sym816 <- symmetry_object(a,Mver=Mver,xver=c(4,15))
a <- symmetrize(a,sym816)
#knotplot2(a)
#knotplot2(a,lwd=1,text=T,circ=F,rainbow=TRUE)

ou816 <- matrix(c(
    16,02,
    03,19,
    12,06,
    07,15,
    21,10,
    11,16,
    19,12,
    15,20
),ncol=2,byrow=TRUE)

#knotplot(a,ou816)

jj <-
  knotoptim(filename,
            symobj = sym816,
            ou   = ou816,
            prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=1000), # these arguments for optim()
#                useNLM=FALSE
)
write_svg(jj, filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

