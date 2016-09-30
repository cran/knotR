library(knotR)

setwd("~/packages/rhankin/packages/trunk/knot/inst/")
filename <- "8_18.svg"
Mrot818 <-
  rbind(
      c(01,05,09,13),
      c(11,15,03,07),
      c(12,16,04,08),
      c(06,10,14,02)
      )

ou818 <-
    matrix(
        c(
            01,11,
            07,02,
            03,14,
            09,03,
            05,15,
            11,06,
            13,07,
            15,10
 ),byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                Mrot = Mrot818,
                ou   = ou818,
                prob=0,
                iterlim=1000,print.level=2
                )


write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))
