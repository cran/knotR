library(knotR)
filename <- "8_9.svg"
a <- reader(filename)
sym89 <- symmetry_object(a,Mver=NULL)


ou89 <- matrix(c(
    08,01,
    15,06,
    05,13,
    12,03,
    02,16,
    20,10,
    09,18,
    17,08
),ncol=2,byrow=TRUE)

jj <-
  knotoptim(filename,
            symobj = sym89,
            ou     = ou89,
            prob   = 0,
#    control=list(trace=100,maxit=1000), # these arguments for optim()
            useNLM=TRUE,
            iterlim=1000, print.level=2

)


write_svg(jj, filename)
save(jj,file=sub('.svg','.data',filename))

