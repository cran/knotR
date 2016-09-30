library(knotR)
filename <- "10_47.svg"
a <- reader(filename)

Mver <-
  matrix(c(
      24,16,
      14,2,
      15,1,
      13,3,      
      22,18,
      21,19,
      23,17,
      12,4
  ),ncol=2,byrow=TRUE)

xver <- 20

ou1047 <- matrix(c(
    1,16,
    17,2,
    4,18,
    20,9,
    8,5,
    11,21,
    6,12,
    12,7,
    23,13,
    15,24
),byrow=TRUE,ncol=2)


sym1047 <- symmetry_object(a, Mver=Mver, xver=xver)

jj <- knotoptim(filename,
                symobj = sym1047,
                ou = ou1047, prob=0,
                iterlim=10, print.level=2 )


write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))



