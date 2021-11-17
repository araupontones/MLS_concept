dofiles <- list.files("C:/Users/andre/Dropbox/MESIP_New_Internal RG/06_Coding/01_Baseline/05_Derivation")



number_dofiles <- length(dofiles) -1
text_dofiles <- knitr::combine_words(dofiles, sep = "* ")
text_dofiles

?knitr::combine_words
text_dofiles
