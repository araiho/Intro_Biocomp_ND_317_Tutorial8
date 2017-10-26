library('stringr')

## Import Data


Cflorida <- scan("~/Desktop/data-shell/Intro_Biocomp_ND_317_Tutorial8/Cflorida.vcf",what=character(),sep = "\n")
#creates an empty file
file.create("CfloridaCounts.txt")

## Regular Expressions! Yay! The first two are standardize the nameing.
## The third regular expression is to find the allele counts for each individual.
TX <- "[Cc][Ff](07)?\\.[Aa]2?"
FL <- "[Cc][Ff]\\.(G2|GAI|gai)"
## I'm not really sure about this one... I'm going to help tomorrow 3-5 to answer some questions
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

  
  
  for (){ #look at old code to see how you looped over a file read in with scan
    if (){ #how can you tell if this is the header line?
      #write unchanged header line to file
    }else if ()){ #how can you tell if this is the line with the column headings?
      #standardize (replace) sample names with TX and FL regexes
      #write new version of line to file
    }else{ #now you're in the data
      #replace full SNP info with allele counts only
      #replace missing data with NA
      #write new version of line to new file
    }
  }

Cflorida <- read.delim("~/Desktop/data-shell/Intro_Biocomp_ND_317_Tutorial8/Cflorida.vcf")

  str_replace_all(Cflorida[1,],TX,paste0("Cf.Sfa.",unlist(strsplit(as.character(Cflorida[1,]),"[.]"))))
  
 
  

