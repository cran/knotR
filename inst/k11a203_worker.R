library(knotR)
filename <- "k11a203.svg"
a <- reader(filename)

Mver <-
  matrix(c(
      12,24,
      23,13,
      22,14,
      11,1,
      21,15,
      10,2,
      16,20,
      9,3
  ),ncol=2,byrow=TRUE)

sym11 <- symmetry_object(a,Mver=Mver)

ou11 <- matrix(c(
    14,1,
    2,15,
    7,4,
    5,19,
    20,6,
    18,8,
    9,17,
    22,11,
    12,23,
    24,13,
    21,16
),byrow=TRUE,ncol=2)


sym11 <- symmetry_object(a, Mver=Mver)

jj <- knotoptim(filename,
                symobj = sym11,
                ou = ou11, prob=0,
#                iterlim=10000, print.level=2 )
                control=list(trace=100,maxit=1000), # these arguments for optim()
                useNLM=FALSE
                )


write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))



