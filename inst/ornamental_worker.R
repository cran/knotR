library(knotR) 
filename <- "20-crossings-ornamental-knot.svg"
filename <- "ornamental20.svg"
a <- reader(filename)

sym20 <- symmetry_object(a, xver=4, Mrot=outer(0:8,c(1,19,37,10,28),"+"))

ou20 <- matrix(c(
    01,42,
    25,02,
    03,27,
    23,04,
    05,31,
    10,06,
    07,29,
    30,09,
    34,11,
    12,36,
    32,13,
    14,40,
    19,15,
    37,33,
    16,38,
    39,18,
    43,20,
    21,45,
    41,22,
    28,24
),ncol=2,byrow=TRUE)



# We will try and request that node 4 is on the vertical centreline.

jj <- knotoptim(filename,
                symobj = sym20,
                ou   = ou20,
                prob=0,
#                iterlim=1, print.level=2


               control=list(trace=100,maxit=1000), # these arguments for optim()
                useNLM=FALSE



                )

write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))
