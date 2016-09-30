library(knotR)
filename <- "9_34.svg"
a <- reader(filename)



sym934 <-
    symmetry_object(
        x    = a,
        Mver = NULL,
        xver = 25,
        mcdonalds=TRUE
        )
    
a <- symmetrize(a,sym934)

ou934  <-
  matrix(c(
      2,19,
      12,3,
      4,10,
      17,5,
      6,24,
      15,8,
      9,22,
      21,13,
      23,16
  ),byrow=TRUE,ncol=2)


knotplot(a,ou934)


jj <- knotoptim(filename,
                symobj  = sym934,
                ou      = ou934,
                prob    = 0,
                iterlim = 100,print.level=2
                )

write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))
