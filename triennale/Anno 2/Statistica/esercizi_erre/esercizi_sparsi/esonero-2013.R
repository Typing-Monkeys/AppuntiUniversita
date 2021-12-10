n1 = sample(3:30, 5, replace = FALSE)
n2 = sample(3:30, 5, replace = FALSE)

pause = c(-3, -1, 1, 3, 7, 8)

classi_n1 = hist(n1, breaks = pause, plot = FALSE)