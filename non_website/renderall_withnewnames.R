setwd("non_website")


rmarkdown::render("presentation_d1.Rmd",output_file = "01_openscience.html")
rmarkdown::render("gitbasics.Rmd",output_file = "06_git.html")
rmarkdown::render("GSP.Rmd",output_file = "11_goodsp.html")
rmarkdown::render("presentation_d2.Rmd",output_file = "12_reproducibility.html")
rmarkdown::render("reproducibleanalysis_intro.Rmd",output_file = "14_repr_analysis.html")
rmarkdown::render("OA_details.Rmd",output_file = "15_OA.html")
rmarkdown::render("Matmeth.Rmd",output_file = "16_material_method.html")
