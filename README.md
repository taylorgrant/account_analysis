
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Twitter account analysis

A series of html rmarkdown reports built out of Twitter timelines,
mentions, and topic models. Data pulled using the
<a href="https://github.com/taylorgrant/twAccount" target="blank">twAccount</a>
package.

Helper functions are used to build the reports. Brand account reports
(single or competitive up to 2 competitors) and interactive topic model
visualizations via crosstalk. The TM reports approximate the `LDAvis`
visuals for a set value of lambda (0.6).

### Directories and Subdirectories

The reports rely upon data and .Rmd files being in specific locations,
so if I never need to rebuild, the directory should look as follows.

-   brand: location of data from twAccount
-   brand_reports: location of final html reports after run through .Rmd
    files
-   docs: location of the .Rmd templates, css, and agency logo
-   functions: helper functions to pass relevant parameters to report
    and render
-   tm_reports: topic model visuals, subfolders for timeline / mentions

<!-- -->

    ├── brand
    ├── brand_reports
    │   ├── brand
    │   ├── group2
    │   ├── group3
    ├── docs
    │   ├── account_analysis.Rmd
    │   ├── group2_analysis.Rmd
    │   ├── group3_analysis.Rmd
    │   ├── gsp_logo_lumen.png
    │   ├── styles.css
    │   └── tm_report.Rmd
    ├── functions
    │   ├── render_group_report.R
    │   └── render_tm_report.R
    └── tm_reports
    │   ├── mentions
    │   └── timeline
