library(stringr)

######Problem 1

readFile <- scan(file = "Cflorida.vcf", what = character(), sep = "\n")
file.create("FixedData.vcf")

#Creating regexpressions
A <- "[Cc][Ff](07)?\\.[Aa]2?"
B <- "[Cc][Ff]\\.[Gg]([Aa][Ii])?2?"
C <- "0/0:[0-9],[0-9]"
D <- "[0-9],[0-9]"

#Looping through contents of file
for (i in 1:length(readFile)) {
  if(str_detect(readFile[i], "##")){
    write(readFile[i],file="FixedData.vcf",append=TRUE)
  } else if (str_detect(readFile[i], "#")) {
    a <- str_replace_all(readFile[i],A,"Cf.Sfa")
    write(str_replace_all(a,B,"Cf.Gai"),file="FixedData.vcf",append=TRUE)
  } else {
  a <- str_extract_all(readFile[i], C)
  a <- str_extract_all(a, D)
  a <- paste( unlist(a), collapse=' ')
  write(a, file="FixedData.vcf", append=TRUE)
  }
}
