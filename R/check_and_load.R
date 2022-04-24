#' checkAndLoad
#' helper function wrapping try catch part of the functionality of loading a package and installation of not available
#'
#' @param pckg character
#' @param mirror character, string for R download mirror
#' @param dependencies bool, is passed to 'install.packages'
#'
#' @noRd
#'
checkAndLoad <- function(pckg, mirror, dependencies, with_cli) {

  possibleError <- tryCatch({

    if(suppressWarnings(suppressPackageStartupMessages(!require(pckg, character.only = TRUE)))) {
      cat("Doing: ", sprintf("install.packages('%s', repos='%s', dependencies=%s)", pckg, mirror, dependencies), "\n")
      eval(
        parse(text =
                sprintf("install.packages('%s', repos='%s', dependencies=%s)", pckg, mirror, dependencies)
        )
      )
      if(pckg %in% utils::installed.packages()[, "Package"] ){
        cat("Doing: ", sprintf("library(%s, character.only = TRUE)", pckg), "\n")
        library(pckg, character.only=TRUE, logical.return=TRUE)
      } else
        stop(sprintf("Package %s could not be installed", pckg))
    }
  },
  error = function(error_message) {

    messaging(msg = sprintf("Error: The package %s is most probably wrongly spelled, check the package\u00b4s name or check the error message above", pckg),
              msg_mode = "m",
              color = "red",
              with_cli = with_cli)

    return(error_message)

  },
  warning = function(warning_message) {

    messaging(msg = sprintf("Warning: The package %s is most probably wrongly spelled, check the package\u00b4s name or check the error message above", pckg),
              msg_mode = "m",
              color = "orange",
              with_cli = with_cli)

    return(warning_message)
  }
  )
  return(possibleError)
}
