library(knotR)
filename <- "9_17.svg"

a <- reader(filename)
Mver <- matrix(c(
    25,1,
    8,18,
    7,19,
    9,17,
    10,16,
    24,2,
    5,21,
    23,3,
    22,4,
    11,15,
    6,20,
    12,14
),ncol=2,byrow=TRUE)


sym917 <-
    symmetry_object(
        x    = a,
        Mver = Mver,
        xver = c(13,26),
        mcdonalds=FALSE
    )

a <- symmetrize(a,sym917)

ou917  <-
  matrix(c(
      02,18,
      16,03,
      04,21,
      22,05,
      06,23,
      12,07,
      09,25,
      24,11,
      20,15
        ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                symobj  = sym917,
                ou      = ou917,
                prob    = 0,
                iterlim = 9000,print.level=2
                )


write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))
