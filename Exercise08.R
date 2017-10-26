library(stringr)



######Problem 1



#Read in data and create new file for output

readFile <- scan(file = "Cflorida.vcf", what = character(), sep = "\n")

file.create("CfloridaCounts.vcf")



###Creating regexpressions



#To standardize samples

A <- "[Cc][Ff](07)?\\.[Aa]2?" #For Texas

B <- "[Cc][Ff]\\.[Gg]([Aa][Ii])?2?" #For FLorida



#For allele counts, including possibility of NA

C <- "([01]/[01]:[0-9],[0-9]|NA)" 

D <- "([0-9],[0-9]|NA)"

#For missing data

E <- "\\./\\."



#The beginning of each line

header <- "Contig[0-9]{2,5}\\s[0-9]{1,2}\\sDeletedStuff\\sGT:AD:DP:GQ:PL"



#Looping through contents of file

for (i in 1:length(readFile)) {
  
  
  
  #Copy first line of original file
  
  if(str_detect(readFile[i], "##")){
    
    write(readFile[i],file="CfloridaCounts.vcf",append=TRUE)
    
    
    
    #Standardizing samples
    
  } else if (str_detect(readFile[i], "#")) {
    
    a <- str_replace_all(readFile[i],A,"Cf.Sfa")
    
    write(str_replace_all(a,B,"Cf.Gai"),file="CfloridaCounts.vcf",append=TRUE)
    
    
    
    #Extracting allele counts
    
  } else {
    
    #Allele counts
    
    a <- str_replace_all(readFile[i],E, "NA") #Replace missing data with NA
    
    a <- str_extract_all(a, C) #Extract data containing allele count
    
    a <- str_extract_all(a, D) #Extract allele count only
    
    a <- paste( unlist(a), collapse='    ') #Convert into string
    
    
    
    #Header for each line
    
    b <- str_extract(readFile[i], header)
    
    
    
    #Combining allele counts and header
    
    c <- paste(b, a, sep=" ")
    
    
    
    #Writing to the file
    
    write(c, file="CfloridaCounts.vcf", append=TRUE)
    
  }
  
}

