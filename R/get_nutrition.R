#' Gets the calories for a recipe using the Nutritionix API
#' @description This function gets the calories for a recipe using the Nutritionix API
#' @param uid
#' @importFrom httr POST
#' @importFrom jsonlite fromJSON
#' @examples
#'
#' \dontrun{
#' get_calories("1 cup of tofu")
#'
get_calories <- function(text) {

  data <- httr::POST(
    "https://trackapi.nutritionix.com/v2/natural/nutrients/",
    body = list(query = text),
    httr::add_headers(`x-app-id` = Sys.getenv("NUTRITIONIX_APP_ID"),
                      `x-app-key` = Sys.getenv("NUTRITIONIX_API_KEY")),
    encode = "json"
  )

  # Retrieve content
  result <- httr::content(data)

  # Sum calories of all ingredients
  sum(sapply(result, function (x) {
    sapply(x, function(y) {
      sum(y['nf_calories'][[1]])
    })
  }))

}
