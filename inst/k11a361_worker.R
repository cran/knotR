library(knotR)
filename <- "k11a361.svg"
a <- reader(filename)

Mver <-
  matrix(c(
      12,24,
      13,01,
      23,11,
      14,02,
      04,16,
      15,03,
      22,10,
      05,17,
      21,9,
      08,20,
      19,07,
      06,18
  ),ncol=2,byrow=TRUE)

ouk11 <-
  matrix(c(
      02,11,
      17,03,
      04,16,
      15,05,
      06,22,
      19,07,
      08,20,
      21,09,
      10,18,
      12,24,
      23,14
  ),byrow=TRUE,ncol=2)


symk11 <- symmetry_object(a, Mver=Mver, xver=NULL, mcdonalds=TRUE)
a  <- symmetrize(as.minobj(a),symk11)

jj <- knotoptim(filename,
                symobj = symk11,
                ou   = ouk11,
                prob=0,
                iterlim=1000, print.level=2
                )


write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))
