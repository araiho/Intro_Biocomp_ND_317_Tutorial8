library(stringr)

######Problem 1

readFile <- scan(file = "Cflorida.vcf", what = character(), sep = "\n")
file.create("FixedData.vcf")

#Creating regexpressions
A <- "[Cc][Ff](07)?\\.[Aa]2?"
B <- "[Cc][Ff]\\.[Gg]([Aa][Ii])?2?"
C <- "([01]/[01]:[0-9],[0-9]|NA)"
D <- "([0-9],[0-9]|NA)"
E <- "\\./\\."

#Looping through contents of file
for (i in 1:length(readFile)) {
  if(str_detect(readFile[i], "##")){
    write(readFile[i],file="FixedData.vcf",append=TRUE)
  } else if (str_detect(readFile[i], "#")) {
    a <- str_replace_all(readFile[i],A,"Cf.Sfa")
    write(str_replace_all(a,B,"Cf.Gai"),file="FixedData.vcf",append=TRUE)
  } else {
  a <- str_replace_all(readFile[i],E, "NA")
  a <- str_extract_all(a, C)
  a <- str_extract_all(a, D)
  a <- paste( unlist(a), collapse='    ')
  write(a, file="FixedData.vcf", append=TRUE)
  }
}

#Using shell and notepad, manually removed the "#" on the second line preceeding "CHROM" so that names of individuals are visible to read.table, and saved as "FixedDataNew.vcf".

#Converted "FixedDataNew.vcf" to a table for easier reading.
test=read.table(file="FixedDataNew.vcf", fill=TRUE)

#Wrote the table to a new file, which is the same as originally file except the changes asked for in the assignment and the removal of the precceding "#" on the second line of the original data.
write.table(test, file="FinalData.vcf")