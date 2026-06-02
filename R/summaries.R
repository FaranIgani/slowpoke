#' Count card rarity by grouping variable
#'
#' @param grouping_var A column to group by (unquoted).
#' @return A tibble with counts of each rarity by group.
#' @importFrom dplyr count mutate group_by
#' @importFrom tidyr pivot_wider
#' @export
rarity_by_release <- function(grouping_var) {

  dat <- load_data()

  dat |>
    count({{grouping_var}}, rarity) |>
    mutate( pct = n / ave(n, {{grouping_var}}, FUN = sum))|>
    pivot_wider(
      names_from = rarity,
      values_from = pct
    )

}




