% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grab_and_attach.R
\name{grab_and_attach}
\alias{grab_and_attach}
\title{grab_and_attach
Tries to load and attach a package. If not available will attempt to install (and continue even if not successull). NSE and character package name evaluation.}
\usage{
grab_and_attach(
  ...,
  mirror = "https://cloud.r-project.org/",
  dependencies = TRUE,
  update_first = FALSE
)
}
\arguments{
\item{...}{package names, NSE or character or mix}

\item{mirror}{character, string for R download mirror}

\item{dependencies}{bool, is passed to 'install.packages'}

\item{update_first}{bool, should firstly 'update.packages' be called first before running 'grab_and_attach'}
}
\description{
grab_and_attach
Tries to load and attach a package. If not available will attempt to install (and continue even if not successull). NSE and character package name evaluation.
}
