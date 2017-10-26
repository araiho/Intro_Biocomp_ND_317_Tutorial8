rm(list=ls())

#load string package
library(stringr)

#open and read the file
vari=scan(file="Cflorida.vcf",what=character(),sep="\n")

#assign the regex strings to variable names
texasnames="(CF|cf)[0-9]*[.][Aa][0-9]*[.]"
floridanames="(CF|cf)[.][Gg][a-zA-Z0-9]*[.]"
detectallele='GT:AD:DP:GQ:PL'
allelename="([0-9]|.)[/]([0-9]|.):([0-9]+,[0-9]+):([0-9]+|.):([0-9]+|.):(([0-9]+),([0-9]+),([0-9]+)|.)"
alleleone="([0-9]|.)[/]([0-9]|.):"
alleletwo=":([0-9]+|.):([0-9]+|.):(([0-9]+),([0-9]+),([0-9]+)|.)"
NAallelename="([0-9]|.)[/]([0-9]|.):(.):([0-9]+|.):([0-9]+|.):(([0-9]+),([0-9]+),([0-9]+)|.)"

for (i in 1:length(vari)){
  if (str_detect(vari[i],'CHROM')==TRUE){
    vari[2]=str_replace_all(vari[i],texasnames,"Cf.Sfa.")
  }
  if (str_detect(vari[i],'CHROM')==TRUE){
    vari[2]=str_replace_all(vari[i],floridanames,"Cf.Gai.")
  }
  if (str_detect(vari[i],detectallele)==TRUE){
    vari[i]=str_replace_all(vari[i],NAallelename,'NA')
  }
  if (str_detect(vari[i],detectallele)==TRUE){
    vari[i]=str_replace_all(vari[i],alleleone,"")
  }
  if (str_detect(vari[i],detectallele)==TRUE){
    vari[i]=str_replace_all(vari[i],alleletwo,"")
  }
}

CfloridaCounts = as.data.frame(matrix(ncol = 1, nrow = 1001), sep = "\n")
for (i in 1:length(vari)){
  CfloridaCounts[i,1]=vari[i]
}

write.table(CfloridaCounts, file='CfloridaCounts.txt', sep = "\n")
