library(knotR)
filename <- "k11a179.svg"
a <- reader(filename)

Mver <-
  matrix(c(
      03,21,
      02,22,
      13,11,
      04,20,
      01,23,
      14,10,
      05,19,
      06,18,
      15,09,
      07,17,
      16,08
  ),ncol=2,byrow=TRUE)

xver  <- c(12,24)

ouk11 <-
  matrix(c(
      05,01,
      02,14,
      13,04,
      15,06,
      07,16,
      17,08,
      09,18,
      19,10,
      11,23,
      21,12,
      24,20
  ),byrow=TRUE,ncol=2)


symk11 <- symmetry_object(a, Mver=Mver, xver=xver)
a  <- symmetrize(as.minobj(a),symk11)

jj <- knotoptim(filename,
                symobj = symk11,
                ou   = ouk11,
                prob=0,
                iterlim=1000, print.level=2
                )



write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))

stop()


