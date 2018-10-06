for (i in 1:dim(df)[1]) {
  for (j in 1:dim(df)[2]) {
    if (is.na(df[i,j])) {
      df[i,j] == 0
    }
  }
  print(i)
}
