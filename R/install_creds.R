#' Adds Paprika username and password to .Renviron file
#' @description This function will add your Paprika username and password to your \code{.Renviron} file. Code for this function was used from a similar function in `tidycensus` (https://github.com/walkerke/tidycensus).
#' @param username
#' @param password
#' @importFrom utils write.table read.table
#' @examples
#'
#' \dontrun{
#' install_paprika_creds("stan_the_man", "1337password")
#'
install_paprika_creds <- function(username, password){

  home <- Sys.getenv("HOME")
  renv <- file.path(home, ".Renviron")
  if(file.exists(renv)){
    # Backup original .Renviron before doing anything else here.
    file.copy(renv, file.path(home, ".Renviron_backup"))
  }
  if(!file.exists(renv)){
    file.create(renv)
  }
  else{
    message("Your original .Renviron will be backed up and stored in your R HOME directory if needed.")
    oldenv=read.table(renv, stringsAsFactors = FALSE)
    newenv <- oldenv[-grep("PAPRIKA_USER", oldenv),]
    newenv <- oldenv[-grep("PAPRIKA_PASS", oldenv),]
    write.table(newenv, renv, quote = FALSE, sep = "\n",
                col.names = FALSE, row.names = FALSE)
  }

  keyconcat <- paste0("PAPRIKA_USER='", username, "'", '\n',
                      "PAPRIKA_PASS='", password, "'")
  # Append API key to .Renviron file
  write(keyconcat, renv, sep = "\n", append = TRUE)
  message('Your API key has been stored in your .Renviron and can be accessed by Sys.getenv("PAPRIKA_USER") and Sys.getenv("PAPRIKA_PASS"). \nTo use now, restart R or run `readRenviron("~/.Renviron")`')

}

#' Adds Nutritionix App ID and API key to .Renviron file
#' @description This function will add your Nutritionix App ID and API key to your \code{.Renviron} file. Code for this function was used from a similar function in `tidycensus` (https://github.com/walkerke/tidycensus).
#' @param app_id
#' @param api_key
#' @importFrom utils write.table read.table
#' @examples
#'
#' \dontrun{
#' install_nutritionix_creds("e7398e84", "36jq73xyuekjrbg6dee2x84448qvtbmn")
#'
install_nutritionix_creds <- function(app_id, api_key){

  home <- Sys.getenv("HOME")
  renv <- file.path(home, ".Renviron")
  if(file.exists(renv)){
    # Backup original .Renviron before doing anything else here.
    file.copy(renv, file.path(home, ".Renviron_backup"))
  }
  if(!file.exists(renv)){
    file.create(renv)
  }
  else{
    message("Your original .Renviron will be backed up and stored in your R HOME directory if needed.")
    oldenv=read.table(renv, stringsAsFactors = FALSE)
    newenv <- oldenv[-grep("NUTRITIONIX_APP_ID", oldenv),]
    newenv <- oldenv[-grep("NUTRITIONIX_API_KEY", oldenv),]
    write.table(newenv, renv, quote = FALSE, sep = "\n",
                col.names = FALSE, row.names = FALSE)
  }

  keyconcat <- paste0("NUTRITIONIX_APP_ID='", app_id, "'", '\n',
                      "NUTRITIONIX_API_KEY='", api_key, "'")
  # Append API key to .Renviron file
  write(keyconcat, renv, sep = "\n", append = TRUE)
  message('Your API key has been stored in your .Renviron and can be accessed by Sys.getenv("NUTRITIONIX_APP_ID") and Sys.getenv("NUTRITIONIX_API_KEY"). \nTo use now, restart R or run `readRenviron("~/.Renviron")`')

}

