library(knotR)
filename <- "7_2.svg"
a <- reader(filename)
knotplot(a)



Mver <- matrix(c(
    09,01,
    08,16,
    02,10,
    03,11,
    07,15,
    04,12,
    13,05,
    06,14
    ),ncol=2,byrow=TRUE)


ou72 <- 
    matrix(c(
        02,10,
        08,03,
        04,07,
        13,05,
        06,14,
        11,16,
        15,12
        ),byrow=TRUE,ncol=2)

knotplot2(a,ou72)

sym72 <- symmetry_object(x=a, Mver = Mver, mcdonalds=TRUE)



jj <- knotoptim(filename,
                symobj = sym72,
                ou   = ou72,
                prob=0,
                iterlim=1000, print.level=0
                )

write_svg(jj,filename)

save(jj,file=sub('.svg','.data',filename))


