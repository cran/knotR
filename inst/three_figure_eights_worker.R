library(knotR) 
filename <- "three_figure_eights.svg"
a <- reader(filename)
Mrot <- matrix(c(
    12,04,20,
    15,07,23,
    14,06,22,
    17,09,01,
    11,03,19,
    16,08,24,
    13,05,21,
    10,02,18
    ),ncol=3,byrow=TRUE)
sym38 <- symmetry_object(a, xver=24, Mrot=Mrot)
#knotplot2(symmetrize(a,sym38),text=T,width=F,lwd=1,rain=T)

ou38 <- matrix(c(
    02,06,
    05,03,
    04,08,
    07,05,
    
    10,14,
    13,11,
    12,16,
    15,13,
    
    18,22,
    21,19,
    20,24,
    23,21
),ncol=2,byrow=TRUE)

a <- symmetrize(a,sym38)


#knotplot(a,ou38)


# We will try and request that node 4 is on the vertical centreline.

jj <- knotoptim(filename,
                symobj = sym38,
                ou   = ou38,
                prob=0,
#                iterlim=1, print.level=2


               control=list(trace=100,maxit=20000), # these arguments for optim()
                useNLM=FALSE
                )

write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))
