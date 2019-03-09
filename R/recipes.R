#' Gets a list of recipes from your Paprika account
#' @description This function will fetch a list of recipes from Paprika account
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#'
get_recipes_list <- function(){

  # If user or pass is not set, stop and tell user
  if(Sys.getenv("PAPRIKA_USER") == "" | Sys.getenv("PAPRIKA_PASS") == "")
    stop("Paprika username or password is not set")

  recipes <- httr::GET(
    "https://www.paprikaapp.com/api/v1/sync/recipes/",
    httr::authenticate(Sys.getenv("PAPRIKA_USER"),
                       Sys.getenv("PAPRIKA_PASS"),
                       type = "basic")
  )

  # If error, stop and print error
  if(!is.null(jsonlite::fromJSON(httr::content(recipe))$error))
    stop(jsonlite::fromJSON(httr::content(recipe))$error$message)

  # Otherwise return results
  (jsonlite::fromJSON(httr::content(recipes)))$result

}

#' Gets the details for a single recipe from Paprika using the recipe's UID
#' @description This function will get the details for a Paprika recipe using UID.
#' @param uid
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#' @examples
#'
#' \dontrun{
#' get_recipe_detail("AB10BD9C-4320-4B95-848F-E9501EC57718")
#'
get_recipe_detail <- function(uid){

  # If user or pass is not set, stop and tell user
  if(Sys.getenv("PAPRIKA_USER") == "" | Sys.getenv("PAPRIKA_PASS") == "")
    stop("Paprika username or password is not set")

  recipe <- httr::GET(
    paste0("https://www.paprikaapp.com/api/v1/sync/recipe/",uid),
    httr::authenticate(Sys.getenv("PAPRIKA_USER"),
                       Sys.getenv("PAPRIKA_PASS"),
                       type = "basic")
  )

  # If error, stop and print error
  if(!is.null(jsonlite::fromJSON(httr::content(recipe))$error))
    stop(jsonlite::fromJSON(httr::content(recipe))$error$message)

  # Otherwise return result
  (jsonlite::fromJSON(httr::content(recipe)))$result

}

