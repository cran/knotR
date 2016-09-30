\name{knots}
\alias{knots}
\alias{k10_123}
\alias{k11a179}
\alias{k3_1}
\alias{k3_1a}
\alias{k4_1}
\alias{k5_1}
\alias{k5_2}
\alias{k6_1}
\alias{k6_2}
\alias{k6_3}
\alias{k7_1}
\alias{k7_2}
\alias{k7_3}
\alias{k7_4}
\alias{k7_5}
\alias{k7_6}
\alias{k7_7}
\alias{k8_1}
\alias{k8_2}
\alias{k8_3}
\alias{k8_4}
\alias{k8_5}
\alias{k8_6}
\alias{k8_7}
\alias{k8_8}
\alias{k8_9}
\alias{k8_10}
\alias{k8_11}
\alias{k8_12}
\alias{k8_13}
\alias{k8_14}
\alias{k8_15}
\alias{k8_16}
\alias{k8_17}
\alias{k8_18}
\alias{k8_19}
\alias{k8_19a}
\alias{k8_20}
\alias{k8_21}
\alias{k9_1}
\alias{k9_2}
\alias{k9_3}
\alias{k9_4}
\alias{k9_5}
\alias{k9_6}
\alias{k9_7}
\alias{k9_8}
\alias{k9_9}
\alias{k9_10}
\alias{k9_11}
\alias{k9_12}
\alias{k9_13}
\alias{k9_14}
\alias{k9_15}
\alias{k9_16}
\alias{k9_17}
\alias{k9_18}
\alias{k9_22}
\alias{k9_23}
\alias{k9_34}
\alias{k9_35}
\alias{k10_61}
\alias{k10_1}
\alias{k11n157}
\alias{k11n157_morenodes}
\alias{k11n22}
\alias{k11a361}
\alias{k12n_0242}
\alias{k12n_0411}
\alias{k_infinity}
\alias{ochiai}
\alias{ornamental20}
\alias{perko_A}
\alias{perko_B}
\alias{pretzel_2_3_7}
\alias{pretzel_7_3_7}
\alias{product_knot}
\alias{amphichiral15}
\alias{satellite}
\alias{three_figure_eights}
\alias{unknot}
\alias{D16}
\docType{data}
\title{Optimized knots}
\description{A variety of knots with optimized forms}
\details{

  A selection of knots that have been optimized for visual appearance.
  The list makes no claims for completeness; the examples are intended
  to show the abilities of the package.

  Knots with names like \code{k7_3} use the naming scheme of Rolfsen.

  Knots with names like \code{k11n157} follow the nomenclature of the
  Hoste-Thistlethwaite table;  \sQuote{a}  means \sQuote{alternating}
  and \sQuote{n} means \sQuote{nonalternating}.
  
  Knot \code{k12a_614} is drawn from the \dQuote{Table of Knot
    Invariants} by Livingstone and Cha.
  
  Knot \code{amphichiral15} is the unique amphichiral knot with crossing
  number 15, due to Hoste, Thistlethwaite, and Weeks.

  Knots \code{k12n_0411} and \code{k11a203} show that partial symmetry
  may be enforced.

  Knot \code{k8_18} is an exceptional knot.

  Knot \code{pretzel_p3_p5_p7_m3_m5} is drawn from a knot appearing in
  Bryant 2016.  The notation specifies the sense (\sQuote{p} for plus
  and \sQuote{m} for minus) of the twists.
  

}
\references{
\itemize{
\item J. C. Cha and C. Livingston. \emph{KnotInfo: Table of Knot Invariants},
\url{http://www.indiana.edu/~knotinfo}, July 7, 2016
\item K. A. Bryant, 2016. \emph{Slice implies mutant-ribbon for odd,
  5-stranted pretzel knots}, \code{arXiv:1511.07009v2}}

}

\examples{
knotplot(k3_1)
## maybe str(k3_1) ; plot(k3_1) ...
}
\keyword{datasets}
