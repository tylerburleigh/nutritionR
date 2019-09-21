#' Get nutrition data using Nutritionix API
#'
#' @description Gets nutrition data from the Nutritionix API
#' @param query The query to lookup nutrition information for
#' @import httr
#' @import jsonlite
#'
#' @examples
#'
#' \dontrun{
#'
#' nutritionix_lookup("1 cup of tofu")
#'
#'}
#'
#'@export
#'
nutritionix_lookup <- function(query) {

  data <- httr::POST(
    "https://trackapi.nutritionix.com/v2/natural/nutrients/",
    body = list(query = query),
    httr::add_headers(`x-app-id` = Sys.getenv("NUTRITIONIX_APP_ID"),
                      `x-app-key` = Sys.getenv("NUTRITIONIX_API_KEY")),
    encode = "json"
  )

  if(length(httr::content(data)$message) > 0){
    stop("Error: Couldn't match any of your foods")
  } else {

    # Return content
    return(httr::content(data))

  }

}

