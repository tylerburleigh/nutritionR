#' Get the sum of a single nutrient from a nutrition object
#'
#' Gets the sum of a single nutrient from a nutrition object. For example, gets the total calories or total fat. For a list of nutrients available, see `data(nutrients)`.
#'
#' @param obj The nutrition object -- a list returned by the `nutritionix_lookup()` function.
#' @param nutrient The nutrient to extract from the nutrition object. Must be one of the nutrients in `data(nutrients)`, such as : "calories", "fat", "carbs", "fiber", "sugar", etc
#'
#' @examples
#'
#' \dontrun{
#'
#' obj <- nutritionix_lookup("1 cheeseburger")
#' nutrition(obj, "calories")
#'
#'}
#'
#'@export
#'


nutrient <- function(obj, nutrient){

  nutrients <- get(data(nutrients))

  a <- nutrients[[nutrient]][['attr_id']]
  u <- nutrients[[nutrient]][['unit']]

  # Sum nutrient from all foods in nutrition object
  amount <- sum(sapply(obj[['foods']], function (x) {
    sum(sapply(x[['full_nutrients']], function(y){
      if(y[['attr_id']] == a) {
        sum(y[['value']])
      } else 0
    }))
  }))

  # Return amount, name, and unit
  return(
    list(name = nutrient, amount = amount, unit = u)
  )
}
