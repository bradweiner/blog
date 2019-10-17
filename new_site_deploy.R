#blog setup from https://www.lentilcurtain.com/posts/how-to-start-a-data-blog-with-r-hugo-blogdown-in-10-short-steps/

library(blogdown)
library(devtools)
blogdown::install_hugo()

install_github("https://github.com/rstudio/blogdown")

new_site(theme = "gcushen/hugo-academic")
build_site()
serve_site()
