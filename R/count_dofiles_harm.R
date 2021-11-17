#count dofiles


dofiles <- list.files(do_bl_harm)

number_dofiles <- length(dofiles)
text_dofiles <- knitr::combine_words(dofiles, sep = "<br> * ")

?knitr::combine_words
text_dofiles
