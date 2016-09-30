library(knotR)
filename <- "pretzel_p3_p5_p7_m3_m5.svg"
a <- reader(filename)

Mver <-
  matrix(c(
      48,12,
      13,47,
      46,14,
      15,45,
      44,16,
      17,43
  ),ncol=2,byrow=TRUE)


p35735  <- symmetry_object(a, Mver=Mver, xver=NULL)
a <- symmetrize(a,p35735)
knotplot2(a,circ=F,lwd=1,text=T,rainbow=T)


jj <- matrix(c(  # NB nonalternating!
    35,02     ,1,
    03,34     ,1,
    33,04     ,1,
    07,41     ,2,
    40,08     ,2,
    09,39     ,2,
    38,10     ,2,
    11,37     ,2,
    49,12     ,3,
    13,48     ,3,
    47,14     ,3,
    15,46     ,3,
    45,16     ,3,
    17,44     ,3,
    43,18     ,3,
    53,20     ,4,
    21,52     ,4,
    51,22     ,4,
    24,60     ,5,
    59,25     ,5,
    26,58     ,5,
    57,27     ,5,
    28,56     ,5
),byrow=TRUE,ncol=3)

ou35735 <- jj[,1:2]

knotplot(a,ou35735,gap=10)

jj <- knotoptim(filename,
                symobj = p35735,
                ou = ou35735, prob=0,
                iterlim=9000, print.level=2
 #               control=list(trace=100,maxit=1000),
 #               useNLM=FALSE
                )

write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))
