% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_splines.R
\name{add_splines}
\alias{add_splines}
\title{Add spline terms to a data frame}
\usage{
add_splines(data, variable, knots = NULL, nk = 5, norm = 2, new_names = NULL)
}
\arguments{
\item{data}{a data frame}

\item{variable}{name of column in data}

\item{knots}{
    knot locations. If not given, knots will be estimated using default
    quantiles of \code{x}. For 3 knots, the outer quantiles used are 0.10
    and 0.90. For 4-6 knots, the outer quantiles used are 0.05 and
    0.95. For \eqn{\code{nk}>6}, the outer quantiles are 0.025 and 0.975. The
    knots are equally spaced between these on the quantile scale. For
    fewer than 100 non-missing values of \code{x}, the outer knots are
    the 5th smallest and largest \code{x}.
  }

\item{nk}{
    number of knots. Default is 5. The minimum value is 3.
  }

\item{norm}{
    \samp{0} to use the terms as originally given by \cite{Devlin and
      Weeks (1986)}, \samp{1} to normalize non-linear terms by the cube
    of the spacing between the last two knots, \samp{2} to normalize by
    the square of the spacing between the first and last knots (the
    default). \code{norm=2} has the advantage of making all nonlinear
    terms beon the x-scale.
  }

\item{new_names}{Optionally specify names of new spline columns}
}
\value{
data frame
}
\description{
Adds spline terms calculated via \code{Hmisc::rcspline.eval()} to a data frame.
}
\section{Knot Locations}{

Knot locations are returned in \code{attr(data[[variable]], "knots")}
}

\examples{
trial \%>\%
  add_splines(age)
}
