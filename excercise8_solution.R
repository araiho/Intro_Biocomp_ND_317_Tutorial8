library(stringr)
var = scan(file = "Cflorida.vcf", what = character(), sep = "\n")
CfloridaCounts.txt<-file("output.txt")
CfloridaCounts = as.data.frame(matrix(ncol = 1, nrow = 1001), sep = "\n")
data=as.data.frame(var)
texasnames="([Cc][Ff])(07)?\\.[Aa][0-9]?\\.([0-9]{3})"
floridanames="([Cc][Ff])\\.[Gg][0-9Aa][Ii]?\\.([0-9]{3})"
allelename="[0-9/][0-9]:([0-9]+),([0-9]+):([0-9]+):([0-9]+):([0-9]+),([0-9]+),([0-9]+)"
is.na<-"[.][/][.][:][.][:][.][:][.][:][.]"
header = "##Deleted a large header, all lines starting with ##"

  
  for(i in 1:length(var)){
    if (str_detect(var[i], texasnames)==TRUE){
newname = str_replace_all(var[i],texasnames,"Cf.Sfa.\3")
CfloridaCounts[i,1] = newname
}

  if (str_detect(var[i], floridanames)==TRUE){
newname = str_replace_all(var[i], floridanames, "Cf.Gai.\2")
CfloridaCounts[i,1] = newname
}
    
    if (str_detect(var[i], allelename)==TRUE){
newname = str_replace_all(var[i], allelename, "\1,\2")
CfloridaCounts[i,1] = newname
    }
  
if (str_detect(var[i],header)==TRUE)
  {
  CfloridaCounts[i,1] = header 
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


      
      
      
   