setwd("c:/Users/DAVIS/Desktop/shell-novice-data/exe8/Intro_Biocomp_ND_317_Tutorial8/")
library(stringr)
Cflorida <- scan(file="Cflorida.vcf",what = character(), skip = 1)
Cflorida2 <- read.table(file="Cflorida.vcf", skip = 1)
colnames(Cflorida2) <- Cflorida[1:90]
Cflorida3 <- as.data.frame(matrix(nrow=999, ncol=90))

#i=5
#j=1
#h=1
#str_detect(colnames(Cflorida2[5]),"CF\\d{0,2}.A[.]+")
#str_detect(colnames(Cflorida2),"[Cc][Ff](07)?\\.[Aa](2)?\\..+")
#dim(Cflorida2[,str_detect(colnames(Cflorida2),"[Cc][Ff](07)?\\.[Aa](2)?\\..+")])
#dim(Cflorida2[,str_detect(colnames(Cflorida2),"[Cc][Ff]\\.[Gg][Aa]?[2Ii]?\\..+")])
#str_replace(colnames(Cflorida2[5]),"[Cc][Ff](07)?\\.[Aa](2)?\\.","Cf.Sfa.")
#str_detect(Cflorida2[1,5],"0\\/0\\:(\\d\\,\\d)\\:\\d\\:\\d\\d?\\:\\d\\,\\d\\d?\\,\\d\\d?\\d?")
#str_replace(Cflorida2[1,5],"0\\/0\\:(\\d\\,\\d)\\:\\d\\:\\d\\d?\\:\\d\\,\\d\\d?\\,\\d\\d?\\d?","\\1")

for(i in 1:length(colnames(Cflorida2))){
  if(str_detect(colnames(Cflorida2[i]),"[Cc][Ff](07)?\\.[Aa](2)?\\..+")==TRUE){
    colnames(Cflorida3)[i] <- str_replace(colnames(Cflorida2[i]),"[Cc][Ff](07)?\\.[Aa](2)?\\.","Cf.Sfa.")
    for(j in 1:length(Cflorida2$POS)){
      if(str_detect(Cflorida2[j,i],"0\\/0\\:(\\d\\,\\d)\\:\\d\\:\\d\\d?\\:\\d\\,\\d\\d?\\,\\d\\d?\\d?")==TRUE){
        Cflorida3[j,i] <- str_replace(Cflorida2[j,i],"0\\/0\\:(\\d\\,\\d)\\:\\d\\:\\d\\d?\\:\\d\\,\\d\\d?\\,\\d\\d?\\d?","\\1")
      }
      else{
        Cflorida3[j,i] <- NA
      }
    }
  }
  else if(str_detect(colnames(Cflorida2[i]),"[Cc][Ff]\\.[Gg][Aa]?[2Ii]?\\..+")==TRUE){
    colnames(Cflorida3)[i] <- str_replace(colnames(Cflorida2[i]),"[Cc][Ff]\\.[Gg][Aa]?[2Ii]?\\.","Cf.Gai.")
    for(h in 1:length(Cflorida2$POS)){
      if(str_detect(Cflorida2[h,i],"0\\/0\\:(\\d\\,\\d)\\:\\d\\:\\d\\d?\\:\\d\\,\\d\\d?\\,\\d\\d?\\d?")==TRUE){
        Cflorida3[h,i] <- str_replace(Cflorida2[h,i],"0\\/0\\:(\\d\\,\\d)\\:\\d\\:\\d\\d?\\:\\d\\,\\d\\d?\\,\\d\\d?\\d?","\\1")
      }
      else{
        Cflorida3[h,i] <- NA
      }
    }
  }
  else{}
}
Cflorida4<-Cflorida3[,5:length(colnames(Cflorida3))]
write.table(Cflorida4, "CfloridaCounts.txt", sep="\n")
