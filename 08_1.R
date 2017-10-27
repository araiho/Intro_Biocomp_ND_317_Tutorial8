
Line <- scan("Cflorida.vcf", what = character(), sep = "\n")
str_replace_all(Line[2], "(CF|cf)[0-9]*.[Aa][0-9]?.([0-9]{3})", "Cf.Sfa.\\2")
file.create("8_1.txt")
write(Line, file = "8_1.txt")

