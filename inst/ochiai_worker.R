library(knotR)
setwd("~/packages/rhankin/packages/trunk/knot/inst/")
filename <- "ochiai.svg"
ou   <-
    matrix(c(
        07,01,
        01,20,
        02,09,
        22,03,
        16,04,
        05,18,
        25,06,
        08,21,
        10,14,
        19,11,
        13,20,
        15,23,
        24,19
    ),ncol=2,byrow=TRUE)

jj <- knotoptim(filename,
                xver = 6,
                ou = ou,
                prob=0,
                iterlim=30, print.level=2
                )

write_svg(jj,filename)
stop() 
