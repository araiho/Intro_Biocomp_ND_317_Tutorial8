library(stringr)

######Problem 1

readFile <- scan(file = "Cflorida.vcf", what = character(), sep = "\n")
file.create("FixedData.vcf")

A <- "[Cc][Ff](07)?\\.[Aa]2?"
B <- "[Cc][Gg](07)?\\.[Aa]2?"
str_replace_all(readFile[2],B,"Cf.Gai")

#Looping through contents of file
for (i in 1:length(readFile)) {
  if(str_detect(readFile[i], "##")){
    write(readFile[i],file="FixedData.vcf",append=TRUE)
  } else if (str_detect(readFile[i], "#")) {
    str_replace_all(readFile[i],A,"Cf.Sfa")
    str_replace_all(readFile[i],B,"Cf.Gai")
    write(readFile[i],file="FixedData.vcf",append=TRUE)
  }
  
}
