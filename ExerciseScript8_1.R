## Keith O'Connor Excercise 8 Problem #1
## This code will find and change the names of files from Florida and Texas to a set naming scheme (elseif statement in for loop).
## Then it will simplify the allele data to allele counts (else part of for loop)
## This is then exported to a new file called "CfloridaCounts.txt"
library('stringr')
## Import Data
Cflorida <- scan("~/Desktop/data-shell/Intro_Biocomp_ND_317_Tutorial8/Cflorida.vcf",what=character(),sep = "\n")
#creates an empty file
file.create("CfloridaCounts.txt")

## Regular Expressions! Yay! The first two are standardize the naming.
## The third regular expression is to find the allele counts for each individual.
TX <- "[Cc][Ff](07)?\\.[Aa]2?"
FL <- "[Cc][Ff]\\.(G2|GAI|gai)"
SNP <- "[01.]/[01.]:([0-9.,]+):[0-9.]+:[0-9.]+:[0-9,.]+"

for(i in 1:length(Cflorida)){
  if(i==1){
    Header <- Cflorida[1]
    write(Header,file="CfloridaCounts.txt",append=TRUE)
  }else if (i==2){
    TXE <- str_replace_all(Cflorida[2],TX,"Cf.Sfa")
    FLE <- str_replace_all(TXE,FL,"Cf.Gai")
    write(FLE,file="CfloridaCounts.txt",append=TRUE)
  } else{
    AL <- str_replace_all(Cflorida[i],SNP,"\\1")
    NSA <- str_replace_all(AL,"\\.","NA")
    write(NSA,file="CfloridaCounts.txt",append=TRUE)
  }
}