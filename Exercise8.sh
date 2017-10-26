library(stringr)

#Set working directory and read files.
setwd("~/Desktop/data-shell/Exercise8/Intro_Biocomp_ND_317_Tutorial8//")

#Read column names as vector.
VCF.names <- scan('Cflorida.vcf', sep="\t", skip=1, nlines=1, character())

#Read data as data frame.
VCF.data <- read.table('Cflorida.vcf')

#Assign regex variables for Texas and Florida, respectively:
regex.name.TX <- "[Cc][Ff](07)?\\.[Aa]2?"
regex.name.FL <- "[Cc][Ff].[Gg][2Aa][Ii]?"

#Replace old Texas names with new naming sysmtem using a regular expression.
VCF.names_temp <- str_replace_all(VCF.names,regex.name.TX, "Cf.Sfa")

#Replace old Florida names with new naming sysmtem using a regular expression.
VCF.names <- str_replace_all(VCF.names_temp,regex.name.FL, "Cf.Gai")

#Creates an empty txt file.
file.create("CfloridaCounts.txt")

#Write headers to a txt file.
write(paste(VCF.names, collapse="\t"), file="CfloridaCounts.txt")

#Create a regex to match the allele count.
regex.data <- "[0-9],[0-9]"

#Loop over each row, extract the allele counts for each element, and write to a txt file.
for (i in 1:dim(VCF.data)[1]){
  data.row <- str_extract(t(VCF.data[i,]), regex.data)
  write(paste(data.row,collapse="\t") , file="CfloridaCounts.txt", append=TRUE)
}

