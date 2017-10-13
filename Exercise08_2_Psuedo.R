#Exercise 8, R, Question 2

#Load package
library('stringr')

#Open files to read and write
seq=scan("seqFastq.fq",what=character(),sep="\n")
ID=scan("indivIDs.txt",sep="\t",what=character())

#read ID list as data frame: barcodes col 1 and sample IDs col 2
ID=read.table("indivIDs.txt",sep="\t",header=FALSE)

#Initialize empty lists
file.create("IDseq.fasta")

#writes ID code to the file
write(string,file="IDseq.fasta",append=TRUE)
#assign regex to a variable name
Z="([ATGC]{8})(AATTC)([ATGC]{3})+"
A="[Vv]([0-9]{2})?.([0-9]{2})?[.]?[A-Za-z0-9]{1,4}.[0-9]{3}"
B="[@]FCC638CACXX[:].+//1$"

#A while loop will allow us to skip operating on fastq lines we don't care about
#set a line counter variable
while (){ #when should your loop stop?
  if (){ #is the current line a header line?
    str_detect(searchString,B)
    #add one to the line counter to move to the sequence line
    if (){ #is your regex in the sequence
      #store your regex matches
      if (){ #is your DNA barcode in the ID data frame?
        #append the start position of the AATTC to your vector, I couldn't find a clean way to get the start pos of the AATTC group
        #I took the position of the full match in the original string, plus the postion of AATTC in the full match -1
        #write the fasta header to your file by getting the correct ID from the data frame
        #write the sequence remaining to the right of the AATTC cut site to your file
      }else{
        #Optional: append location of AATTC to "bad" vector (pattern found but no barcode match) as above
      }
    }
    #add 3 to your line counter to skip over + and quality scores lines, to get to the next header     
  }else{
    #it's a good idea to break loop and print error message if you end up here
    #this means your line counter is off or the input file isn't in the right format (it is!)
  }
}

#Graph histograms of good and bad start positions
a=ggplot("")
a+geom_histogram()
