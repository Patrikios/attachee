#' messaging
#' help function for printing infos
#'
#' @param msg character
#' @param msg_mode character, 'cat' or 'message'
#' @param color character, color
#' @param with_cli bool, giving if 'cli' package is available
#'
#' @noRd
#'
messaging <- function(msg, msg_mode = c("cat", "message"), color, with_cli){

  m <- match.arg(msg_mode)

  # use cat or otherwise message interface
  if(m == "cat"){

    if(with_cli)
      cli::cat_line(msg, col = color)
    else
      cat(msg, "\n")

  } else if(m == "message"){

    if(with_cli)
      cli::cat_line(msg, col = color)
    else
      message(msg)

  }
}
