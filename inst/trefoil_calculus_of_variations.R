library(deSolve)


func <- function(t, state, parameters) {

   with(as.list(c(state, parameters)),{
     dy <- yd
     dyd <- ydd

     p <- yd  # pee becomes y-dash
     pd <- ydd # pee-dash becomes y-dash-dash
     ## pdd <- 5/(1+p^2)*(p*pd-pd^2) + p/2*lambda*(1+p^2)^2 # me
     ## pdd <- 0.5*(1+p^2)^(5/2)*(lambda*p/sqrt(1+p^2) + (5/2)*pd^2/(1+p^2)^(7/2))
     dydd <- 0.5*(
       (1+yd^2)^(5/2)*(mu + (yd*(lambda* (1+yd^2)^3) + 5*ydd^2))/(1+yd^2)^(7/2)
       )
       
     
     # return the rate of change
     list(c(dy,dyd,dydd))
   })   # end with(as.list ...
 }
 library(deSolve)

f <- function(sec,lam,mu,tmax=1,...){
  times <- seq(from=0,to=tmax,len=100)
  state <- c(y=0, yd=1, ydd=sec)  # sec == second derivative
  parameters <- c(lambda = lam,mu=mu)
  out <- ode(y = state, times = times, func = func, parms = parameters)
  plot(y~time,data=out,type='b',asp=1,...)
  abline(h=0)
  return(invisible(out))
}

  
