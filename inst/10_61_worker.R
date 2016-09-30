library(knotR)
filename <- "10_61.svg"
a <- reader(filename)

Mver <-
  matrix(c(
      16,24,
      15,01,
      23,17,
      22,18,
      14,02,
      04,12,
      05,11,
      13,03,
      06,10,
      21,19,
      07,09
  ),ncol=2,byrow=TRUE)

xver <- c(20,8)

ou1061 <- matrix(c(
    02,18,
    12,03,
    04,13,
    14,05,
    06,22,
    21,08,
    09,20,
    19,11,
    23,15,
    17,24
),byrow=TRUE,ncol=2)


sym1061 <- symmetry_object(a, Mver=Mver, xver=xver)
ar <- symmetrize(as.minobj(a),sym1061)


jj <- knotoptim(filename,
                symobj = sym1061,
                ou = ou1061, prob=0,
                iterlim=1000, print.level=2 )



write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))


