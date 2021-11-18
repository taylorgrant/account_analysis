# intended for after all data's been pulled from Twitter and topic modeling
# has been run on 2 brands 
group_report <- function(handle, handle2 = NULL, handle3 = NULL) {
  library(tidyverse)
  # always set  
  d <- "/Users/taylor_grant/R/sandbox/twitter/account_analysis"
  dd <- "/Users/taylor_grant/R/sandbox/twitter/account_analysis/brand"
  logo <- file.path(d, "docs/gsp_logo_lumen.png")
  date <- Sys.Date()
  
  if (is.null(handle2)) {
    h1_date <- dplyr::last(dir(file.path(dd, glue::glue('{handle}'))))
    data <- file.path(dd, handle, h1_date, glue::glue('{handle}_twitter_info.rds'))
    collage <- grep("2018", dir(file.path(dd, handle, h1_date, "final_cols"), full.names = TRUE), invert=TRUE, value = TRUE) 
    rmarkdown::render(input = file.path(d, "docs/account_analysis.Rmd"),
                      output_file = glue::glue(d, "/brand_reports/brand/{handle}-{h1_date}.html"),
                      params = list(logo = logo,
                                    data = data,
                                    handle = handle,
                                    collage = collage))
  } else if (is.null(handle3)) {
    # extract date that it was run - we're pulling the last (most recent)
    h1_date <- dplyr::last(dir(file.path(dd, glue::glue('{handle}'))))
    h2_date <- dplyr::last(dir(file.path(dd, glue::glue('{handle2}'))))
    # twitter data pull 
    data <- file.path(dd, handle, h1_date, glue::glue('{handle}_twitter_info.rds'))
    data2 <- file.path(dd, handle2, h2_date, glue::glue('{handle2}_twitter_info.rds'))
    # twitter imagery (excluding 2018) 
    collage <- grep("2018", dir(file.path(dd, handle, h1_date, "final_cols"), full.names = TRUE), invert=TRUE, value = TRUE) 
    collage2 <- grep("2018", dir(file.path(dd, handle2, h2_date, "final_cols"), full.names = TRUE), invert=TRUE, value = TRUE)
    # build report
    rmarkdown::render(input = file.path(d, "docs/group2_analysis.Rmd"),
                      output_file = glue::glue(d, "/brand_reports/group2/{handle}-{handle2}-{date}.html"),
                      params = list(logo = logo,
                                    data = data,
                                    data2 = data2,
                                    handle = handle,
                                    handle2 = handle2,
                                    collage = collage,
                                    collage2 = collage2))
  } else {
    # extract date that it was run - we're pulling the last (most recent)
    h1_date <- dplyr::last(dir(file.path(dd, glue::glue('{handle}'))))
    h2_date <- dplyr::last(dir(file.path(dd, glue::glue('{handle2}'))))
    h3_date <- dplyr::last(dir(file.path(dd, glue::glue({handle3}))))
    # twitter data pull 
    data <- file.path(dd, handle, h1_date, glue::glue('{handle}_twitter_info.rds'))
    data2 <- file.path(dd, handle2, h2_date, glue::glue('{handle2}_twitter_info.rds'))
    data3 <- file.path(dd, handle3, h3_date, glue::glue('{handle3}_twitter_info.rds'))
    # twitter imagery (excluding 2018) 
    collage <- grep("2018", dir(file.path(dd, handle, h1_date, "final_cols"), full.names = TRUE), invert=TRUE, value = TRUE) 
    collage2 <- grep("2018", dir(file.path(dd, handle2, h2_date, "final_cols"), full.names = TRUE), invert=TRUE, value = TRUE)
    collage3 <- grep("2018", dir(file.path(dd, handle3, h3_date, "final_cols"), full.names = TRUE), invert=TRUE, value = TRUE)
    # run report 
    rmarkdown::render(input = file.path(d, "docs/group3_analysis.Rmd"),
                      output_file = glue::glue(d, "/brand_reports/group3/{handle}-{handle2}-{handle3}-{date}.html"),
                      params = list(logo = logo,
                                    data = data,
                                    data2 = data2,
                                    data3 = data3,
                                    handle = handle,
                                    handle2 = handle2,
                                    handle3 = handle3,
                                    collage = collage,
                                    collage2 = collage2,
                                    collage3 = collage3))
  }
}
  
  
 
group_report("BMWUSA")
group_report(handle = "BMWUSA", handle2 = "MercedesBenzUSA")
group_report(handle = "BMWUSA", handle2 = "MercedesBenzUSA", handle3 = "Lexus")
 