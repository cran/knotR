library(knotR)
filename <- "product_knot.svg"

a <- reader(filename)
symprod <- symmetry_object(a,xver=c(9,17))      # no real symmetry, but force

ouprod <- matrix(c(
    01,07,
    06,02,
    03,09,
    08,05,
    10,14,
    16,11,
    13,17
),ncol=2,byrow=TRUE)


jj <- knotoptim(filename,
                symobj = symprod,
                ou   = ouprod,
                prob = 0,
                iterlim=1000, print.level=2
                )

write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))
stop()
