library(knotR)
filename <- "9_6.svg"
a <- reader(filename)

Mver <- matrix(c(
    23,01,
    11,13,
    14,10,
    22,02,
    09,15,
    08,16,
    21,03,
    07,17,
    06,18,
    20,04,
    19,05
),ncol=2,byrow=TRUE)


sym96 <-
    symmetry_object(
        x    = a,
        xver = c(12,24),
        Mver = Mver
    )


a <- symmetrize(a,sym96)

ou96  <-
    matrix(c(
        01,13,
        16,03,
        04,18,
        19,06,
        07,21,
        22,09,
        10,15,
        14,11,
        12,24
    ),byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                symobj  = sym96,
                ou      = ou96,
                prob    = 0,
                iterlim = 9000, print.level=2
                )

write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))
