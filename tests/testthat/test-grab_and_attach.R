test_that("'grab_and_attach' function works", {

  if('parallel' %in% installed.packages()[, 'Package']){

    if('parallel' %in% .packages()) detach("package:parallel")

    result <- evaluate_promise(grab_and_attach("parallel"))
    result <- gsub("[\n-]+", "", result$output)
    expect_true(result == "Loading package :parallel...package loaded!")

    result <- evaluate_promise(grab_and_attach("parallel"))
    result <- gsub("[\n-]+", "", result$output)
    expect_true(result == "Package parallel is already loaded")

  } else stop("No package 'parallel' found install in your R installation which is weird (it is a R system package)!")

})



