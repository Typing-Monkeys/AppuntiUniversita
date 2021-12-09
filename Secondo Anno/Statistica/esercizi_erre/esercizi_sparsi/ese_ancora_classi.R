dati = c(8, 4, 5, 3, 16, 7, 7)
breaks = c(0, 2, 14, 18, 24, 40, 60, 70)

classi = hist(dati, breaks = breaks, plot = FALSE, right = FALSE)
classi_nomi = names(table(cut(dati, breaks, right = FALSE)))

ni = classi$counts