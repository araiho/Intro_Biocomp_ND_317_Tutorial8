rm(list=ls())

#load string package
library(stringr)

#open and read the file
vari=scan(file="Cflorida.vcf",what=character(),sep="\n")

#assign the regex strings to variable names
texasnames="[(CF)(cf)][0-9]*[.][Aa][0-9]*[.]"
floridanames="[(CF)(cf)][.][Gg][a-zA-Z0-9]*[.]"
allelename="[0-9/][0-9]:([0-9]+),([0-9]+):([0-9]+):([0-9]+):([0-9]+),([0-9]+),([0-9]+)"
is.na<-"[.][/][.][:][.][:][.][:][.][:][.]"
header = "##Deleted a large header, all lines starting with ##"

for (i in 1:length(vari)){
  if (str_detect(vari[i],'CHROM')==TRUE){
    vari[2]=str_replace_all(vari[i],texasnames,"f.Sfa.")
  }
  if (str_detect(vari[i],'CHROM')==TRUE){
    vari[2]=str_replace_all(vari[i],floridanames,"f.Gai.")
  }
}
