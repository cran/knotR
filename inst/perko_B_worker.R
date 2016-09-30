library(knotR)
filename <- "perko_B.svg"
a <- reader(filename)

sym_perko_B <- symmetry_object(a, xver=23 )

ou_perko_B <- matrix(c(
    16,01,
    02,14,
    03,20,
    12,04,
    18,05,
    06,17,
    07,11,
    22,08,
    10,23,
    19,13),
    byrow=TRUE,ncol=2)

jj <- knotoptim(filename,
                symobj = sym_perko_B,
                ou   = ou_perko_B,
                prob = 0,
#                iterlim=1000, print.level=0

                control=list(trace=100,maxit=1000), # these arguments for optim()
                useNLM=FALSE


                )

write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))
