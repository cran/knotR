library(knotR)
filename <- "7_3.svg"
a <- reader(filename)

Mver  <- matrix(c(
    07,05,
    16,14,
    08,04,
    17,13,
    02,10,
    11,01,
    18,12
    ),byrow=TRUE,ncol=2)


ou73 <-
    matrix(c(
        01,12,
        11,02,
        03,10,
        14,04,
        06,15,
        16,07,
        09,17
        ),byrow=TRUE,ncol=2)

sym73 <- symmetry_object(a, Mver=Mver, xver=c(6,15))

jj <- knotoptim(filename,
                symobj = sym73,
                ou   = ou73,
                prob=0,
                iterlim=1000,print.level=2
                )

save(jj,file=sub('.svg','.data',filename))
write_svg(jj,filename)
stop() 





## Function symmetrize_LR() creates a symmetrized knot:
k7_3_symmetrized <- symmetrize(as.minobj(k7_3), sym_7_3)

knotplot(k7_3_symmetrized,T,T,T,T,T,circ=500)  #OK, it looks terrible


mii <- make_minsymvec_from_minobj(k7_3_symmetrized,sym_7_3)
pii <- make_minobj_from_minsymvec(mii,sym_7_3)





knotplot2(k7_3_symmetrized, ou_7_3)

# now optimize; first define an objective function:

`objective_function` <- function(m){
    badness(make_minobj_from_minsymvec(m, sym_7_3),prob=0.1)
}

o <- nlm(objective_function,mii,iterlim=200,print.level=2)


opt_7_3 <-  make_minobj_from_minsymvec(o$estimate,sym_7_3)
knotplot(opt_7_3,T,T,T,T,circ=1900)



