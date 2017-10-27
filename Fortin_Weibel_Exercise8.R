##Question 1

library(stringr)

vcr <- scan('/Users/elizabethfortin12/Documents/ND First Year/Biocomputing/R_Programming/Exercise8/Cflorida.vcf', what = character(), sep="\n")
write(vcr, "vcr.txt")

head(vcr)
header <- c()
name <- c()
allele <- c()

for(i in 1:length(vcr)){
  if (str_detect(vcr[i],"##")=='TRUE'){
    header <- vcr[i]
    write(header, "CfloridaCounts.txt")
  }
  else if (str_detect(vcr[i],"#")=='TRUE'){
    name <- vcr[i]
    for (j in 1:length(name)){
      name[j] <- str_replace_all(name[j],"[Cc][Ff](07)?\\.[Aa]2?","Cf.Sfa") 
      name[j] <- str_replace_all(name[j],"[Cc][Ff]\\.[Gg]([Aa][Ii])?2?","Cf.Gai")
    }
    write(name, "CfloridaCounts.txt", append = TRUE)
  }
  else if (str_detect(vcr[i], "#")=='FALSE'){
    allele <- vcr[i]
    for (j in 1:length(allele)){
      allele[j] <- str_extract(allele[j], ":[0-9],[0-9]:")
    }
    write(allele, "CfloridaCounts.txt", append = TRUE)
  }
}

