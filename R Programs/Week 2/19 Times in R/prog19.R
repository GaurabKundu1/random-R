x <- Sys.time()
x

p <- as.POSIXlt(x)
names(unclass(p))

p$sec