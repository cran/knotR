library(knotR)
filename <- "8_19.svg"
a <- reader(filename)
Mver <- matrix(c(
    02,18,
    03,17,
    04,16,
    05,15,
    07,13,
    08,12,
    09,11,
    14,06
),ncol=2,byrow=TRUE)

ou819 <- matrix(c(  # NB Not alternating!
    01,06,
    02,15,
    09,03,
    05,10,
    06,15,
    14,07,
    12,18,
    16,11
),ncol=2,byrow=TRUE)

sym819 <- symmetry_object(a,Mver=Mver,xver=c(1,10))

jj <-
  knotoptim(filename,
            symobj = sym819,
            ou   = ou819,
                prob = 0,
                iterlim=1000, print.level=2
#                control=list(trace=100,maxit=100000), useNLM=FALSE
                )

write_svg(jj,filename,safe=FALSE)
dput(jj,file=sub('.svg','.S',filename))

