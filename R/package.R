#' @name praiserror-package
#' @title praiserror
#' @aliases praiserror-package praiserror
#' @docType package
#' @description A Sarcastic Error Handler
#' @details This package provides you with a useless and demoralizing error handler. Please turn your speakers on.
#' @author Thomas J. Leeper <thosjleeper@gmail.com>
#' @importFrom audio load.wave play
#' @keywords package 
NULL

.onLoad <- function(libname, pkgname) {
    options('show.error.messages'=FALSE)
    f <- function() {
        a <- system.file("audio", "error.wav", package = "praiserror")
        play(load.wave(a))
        Sys.sleep(3)
        cat(geterrmessage(), "\n")
        return(NULL)
    }
    options(error = f)
    invisible(NULL)
}

.onUnload <- function(libname, pkgname) {
    options('show.error.messages'=TRUE)
    options(error = NULL)
    invisible(NULL)
}
