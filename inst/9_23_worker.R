library(knotR)

filename <- "9_23.svg"
a <- reader(filename)
ou923 <- matrix(  # alternating
    c(
        1,4,
        11,2,
        3,12,
        5,14,
        9,6,
        7,16,
        17,8,
        13,10,
        15,18
    ) , byrow=TRUE,ncol=2)

Mver923 <- 
    matrix(
        c(
            15,3,
            7,11,
            17,1,
            14,4,
            16,2,
            8,10,
            5,13,
            6,12
        ), byrow=TRUE,ncol=2)

Mhor923 <- 
    matrix(
        c(
            15,6,
            7,16,
            17,8,
            14,5,
            18,9,
            4,13,
            1,10,
            3,12,
            11,2
            
            ),
        byrow=TRUE,ncol=2
        )

sym923 <-
    symmetry_object(a,Mhor=Mhor923,Mver=Mver923,celtic=FALSE,xver=c(9,18))

jj <- knotoptim(filename,
                symobj=sym923,
                ou   = ou923,
                prob=0,
                iterlim=100,print.level=2
                )

write_svg(jj,filename)
save(jj,file=sub('.svg','.data',filename))
stop()

