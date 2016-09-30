library(knotR)


filename <- "6_3.svg"


ou63 <- matrix(c(
    01,09,
    05,02,
    03,11,
    12,04,
    10,06,
    07,13
    ),byrow=TRUE,ncol=2)


jj <- knotoptim(filename,
                xver = 10,
                ou   = ou63,
                prob=0,
                iterlim=1000,print.level=0
                )

write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))
stop() 



a <- reader("~/packages/rhankin/packages/trunk/knot/inst/6_3.svg")
knotplot(a,T,T,T,T,T)
## Now create a symmetry object (look at the knotplot(a) to see the
## nodes that are rotationally related, and also the nodes that are on
## the centreline)


sym63 <- symmetry_object(a,xver=10)   # no real symmetry, but force
                                      # node 10 to be on the
                                      # centreline

## Function symmetrize_LR() creates a symmetrized knot:
k63 <- symmetrize(as.minobj(a), sym63)

knotplot(k63,T,T,T,T,T,circ=500)  #OK, it looks terrible

mii <- make_minsymvec_from_minobj(k63,sym63)
pii <- make_minobj_from_minsymvec(mii,sym63)


ou63 <- matrix(c(
    1,9, 5,2, 3,11, 12,4, 10,6, 7,13
    ),byrow=TRUE,ncol=2)

knotplot2(k63,ou63)


# now optimize; first define an objective function:

`objective_function` <- function(m){
    badness(make_minobj_from_minsymvec(m, sym63))
}

o <- nlm(objective_function,mii,iterlim=20,print.level=2)
stop()

opt63 <-  make_minobj_from_minsymvec(o$estimate,sym63)
knotplot(opt63,T,T,T,T,circ=1900)



