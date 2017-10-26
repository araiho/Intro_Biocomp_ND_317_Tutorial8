rm(list=ls())

#load string package
library(stringr)

#open and read the file
vari=scan(file="Cflorida.vcf",what=character(),sep="\n")

#initialize output file
CfloridaCounts = as.data.frame(matrix(ncol = 1, nrow = 1001), sep = "\n")

#assign the regex strings to variable names
texasnames="([Cc][Ff])(07)?\\.[Aa][0-9]?\\.([0-9]{3})"
floridanames="([Cc][Ff])\\.[Gg][0-9Aa][Ii]?\\.([0-9]{3})"
allelename="[0-9/][0-9]:([0-9]+),([0-9]+):([0-9]+):([0-9]+):([0-9]+),([0-9]+),([0-9]+)"
is.na<-"[.][/][.][:][.][:][.][:][.][:][.]"
header = "##Deleted a large header, all lines starting with ##"

#loop over file
  for(i in 1:length(vari)){
    if (str_detect(vari[i],header)==TRUE) #detects header line
    {
      CfloridaCounts[i,1] = header #writes headerline to the output file
    }
    if (str_detect(vari[i], texasnames)==TRUE){ #detects sample names
newname = str_replace_all(vari[i],texasnames,"Cf.Sfa.\3")#replaces sample names
CfloridaCounts[i,1] = newname #writes sample name to outputfile
}

  if (str_detect(vari[i], floridanames)==TRUE){ #detects sample names
newname = str_replace_all(vari[i], floridanames, "Cf.Gai.\2")#replaces sample names
CfloridaCounts[i,1] = newname#writes sample name to outputfile
}
    
    if (str_detect(vari[i], allelename)==TRUE){#detects allele names
newname = str_replace_all(vari[i], allelename, "\1,\2")# replaces allele names
CfloridaCounts[i,1] = newname#writes allele names to outputfile
    }
  

  }
#thispartisnotworking
# for(i in 1:length(var)){
# if (anyNA(var[i])){
#   newname = (is.na(var)) <- NA
#   CfloridaCounts[i,1] = newname
# }
# }
# for(i in 1:length(var)){
#   if (str_detect(var[i], nodata)==TRUE){
#     newname = str_replace_all(var[i], nodata, "NA")
#     CfloridaCounts[i,1] = newname
#   }
# }

for(i in 1:length(vari)){
      newname = str_replace_na(vari[i], replacement = "NA")
      CfloridaCounts[i,1] = newname
    }

      
      
      
   