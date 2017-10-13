rm(list=ls())

library(stringr)

unModifiedData=scan(file="Cflorida.vcf",what=character(),sep="")
CleanTable = data.frame(matrix(ncol = 1, nrow = 100))

SampleNameTexas="[Cc][Ff][0-9]*[.][Aa][0-9]*[.][0-9]{3}"
SampleNameFlorida="[Cc][Ff][.][Gg][A-Za-z0-9]*[.][0-9]{3}"

for (i in 1:length(unModifiedData)){
  if (str_detect(unModifiedData[i],SampleNameTexas)==TRUE){
    NewName=str_replace(unModifiedData[i],'[Cc][Ff][0-9]*[.][Aa][0-9]*','Cf.Sfa')
    CleanTable[i,1]=NewName
  }
  else if (str_detect(unModifiedData[i],SampleNameFlorida)==TRUE){
    NewName=str_replace(unModifiedData[i],'[Cc][Ff][.][Gg][A-Za-z0-9]*','Cf.Gai')
    CleanTable[i,1]=NewName
  }
}
