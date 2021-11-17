derived_dir <-"C:/Users/andre/Dropbox/MESIP_New_Internal RG/05_Data/01_Baseline/05_Derived"

exdir <- "report/tables"
exfile_s <- file.path(exdir, "varNamesSchool.rds")
exfile_p <- file.path(exdir, "varNamesPupils.rds")
exfile_t <- file.path(exdir, "varNamesTeachers.rds")


s <- rio::import(file.path(derived_dir, "school_level_indicators_final_c1.dta" ))
p <- rio::import(file.path(derived_dir, "student_level_indicators_final_c1.dta" ))
t <- rio::import(file.path(derived_dir, "teacher_level_indicators_final.dta" ))


#create tables with names
school_derived <- create_data_info(s)
pupil_derived <- create_data_info(p)
teacher_derived <- create_data_info(t)


export(school_derived, exfile_s)
export(pupil_derived, exfile_p)
export(teacher_derived, exfile_t)





