#' grab_and_attach
#' Tries to load and attach a package. If not available will attempt to install (and continue even if not successull). NSE and character package name evaluation.
#'
#' @param ... package names, NSE or character or mix
#' @param mirror character, string for R download mirror
#' @param dependencies bool, is passed to 'install.packages'
#' @param update_first bool, should firstly 'update.packages' be called first before running 'grab_and_attach'
#'
#'@export
#'
grab_and_attach <- function(..., mirror = "https://cloud.r-project.org/", dependencies = TRUE, update_first = FALSE) {

  # update first of all if the arg 'update_first' is TRUE

  if(update_first) utils::update.packages(repos = mirror, ask = FALSE)

  # helper function for printing the messeges

  # use cli if available
  with_cli <- "cli" %in% utils::installed.packages()[, "Package"]
  if(with_cli) suppressPackageStartupMessages(requireNamespace('cli')) else cat("\n>Install package 'cli' for colored console outputs.<\n")

  # parse either character or nse args (packages to attach)
  if(all(lapply(match.call(expand.dots = FALSE)$..., class) == "call")) {
    args <- eval(parse(text = paste0(match.call(expand.dots = FALSE)$...)))
  } else {
    args <- paste0(match.call(expand.dots = FALSE)$...)
  }

  cat("\n-------\n")

  # process libraries one by one i a loop
  for(i in args) {

    cat("\n")

    if(i %in% .packages()) {

      messaging(msg = sprintf("Package %s is already loaded", i), msg_mode = "c", color = "blue", with_cli = with_cli)

      cat("\n-------\n")

    } else if(i %in% utils::installed.packages()[, "Package"]){

      messaging(msg = sprintf("Loading package :%s", i), msg_mode = "c", color = "blue", with_cli = with_cli)

      library(i, character.only = TRUE)

      messaging(msg = "...package loaded!", msg_mode = "c", color = "blue", with_cli)

      cat("\n-------\n")

    } else {

      messaging(msg = sprintf("Installing package :%s", i), msg_mode = "c", color = "blue", with_cli = with_cli)

      skipRule <- checkAndLoad(i, mirror, dependencies, with_cli = with_cli)

      if(inherits(skipRule, "error") || inherits(skipRule, "warning")) {

        cat("\n-------\n")
        next

      } else {

        messaging(msg = "...package loaded!", msg_mode = "c", color = "blue", with_cli = with_cli)

        cat("\n-------\n")
      }
    }
  }
}
