render_tm_report <- function(handle, report = c('timeline', "mentions")) {
  library(tidyverse)
  # always set  
  d <- "/Users/taylor_grant/R/sandbox/twitter/account_analysis"
  dd <- "/Users/taylor_grant/R/sandbox/twitter/account_analysis/brand"
  logo <- file.path(d, "docs/gsp_logo_lumen.png")
  date <- Sys.Date()
  # extract date that it was run - we're pulling the last (most recent)
  h1_date <- dplyr::last(dir(file.path(d, "brand" ,glue::glue('{handle}'))))
  # twitter data pull
  if (report == "timeline") {
    data <- file.path(dd, handle, h1_date, glue::glue('{handle}_tm_timeline.rds'))
    rmarkdown::render(input = file.path(d, "docs/tm_report.Rmd"),
                      output_file = glue::glue(d, "/tm_reports/timeline/{handle}-{report}-{h1_date}.html"),
                      params = list(logo = logo,
                                    data = data,
                                    handle = handle,
                                    report = report))
  } else {
    data <- file.path(dd, handle, h1_date, glue::glue('{handle}_tm_mentions.rds'))
    rmarkdown::render(input = file.path(d, "docs/tm_report.Rmd"),
                      output_file = glue::glue(d, "/tm_reports/mentions/{handle}-{report}-{h1_date}.html"),
                      params = list(logo = logo,
                                    data = data,
                                    handle = handle))
  }
}



