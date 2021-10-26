# dependencies
library(blogdown)
library(fs)

## confirm auto update data
auto_update <- usethis::ui_yeah("Do you want to automatically update the remote GitHub repo?")

# clean-up current site
if (dir_exists(path = "docs/") == TRUE){
  dir_delete(path = "docs/") 
}

# build site
build_site()

# move site to docs/
dir_copy(path = "public/", new_path = "docs/", overwrite = TRUE) 

# clean-up directories
dir_delete(path = "public/")

# optionally pushed to GitHub
if (auto_update == TRUE){
  
  system("git add -A")
  system(paste0("git commit -a -m 'update site for ", as.character(Sys.Date()), "'"))
  system("git push origin master")
  
}
