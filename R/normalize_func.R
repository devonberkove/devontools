#' Normalize column by attribute
#'
#' `normalize()` normalizes the values within a column relative to the total
#'  number of observations in its group from another attribute.
#'
#' @param df Input data frame. The data frame from which a column will be
#' normalized.
#' @param attribute Input symbol. The column name used to group the data.
#' @param prop_attribute Input symbol. The column name containing the values
#' of which the normalized column will be added to find the total and
#' divided by to find the proportion.
#' @param prop_column Input Boolean. An optional argument determining if the
#' returned data frame contains a proportion column or not.
#'
#' @returns A data frame, containing a new total column for the number of
#' observations within `prop_attribute` and an optional proportion column.
#'
#' @examples
#' df <- data.frame(
#'   major = c("History", "Math", "Math", "Chemistry", "History", "Math"),
#'   students = c(15, 25, 40, 20, 15, 20)
#'   )
#'
#' # Find totals for each major
#' normalize(df, major, students)
#'
#' # Find proportion of students in observation compared to all students in the major
#' normalize(df, major, students, prop_column = TRUE)
#'
#' @importFrom magrittr %>%
#' @export
normalize <- function(df, attribute, prop_attribute, prop_column = FALSE){

  attribute <- rlang::enquo(attribute)
  prop_attribute <- rlang::enquo(prop_attribute)

  if(!rlang::is_symbol(rlang::quo_get_expr(attribute))){
    stop("attribute must be a column name")
  }

  if(!rlang::is_symbol(rlang::quo_get_expr(prop_attribute))){
    stop("prop_attribute must be a column name")
  }

  total_for_norm <- df %>%
    dplyr::group_by(!!attribute) %>%
    dplyr::summarise(total = sum(!!prop_attribute))

  df <- df %>%
    dplyr::left_join(total_for_norm, by = dplyr::join_by(!!attribute))

  if (prop_column == TRUE) {
    df <- df %>%
      dplyr::mutate(prop = !!prop_attribute/total)

    return(df)
  } else {
    return(df)
  }
}
