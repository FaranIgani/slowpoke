#' Load bundled Pokémon TCG dataset
#'
#' @return A tibble containing Pokémon TCG data.
#' @export
.pokemon_cache <- new.env(parent = emptyenv())

# only gets it once! next time you run or use load_data its already cached
load_data <- function() {
  if (!exists("dat", envir = .pokemon_cache)) {
    path <- "https://www.dropbox.com/scl/fi/tnl4wcmgduu3bnmmllz2u/pokemon_cards.csv?rlkey=h7evg3hr4ckzqrxrzoy458ojs&st=uzrlktbc&dl=1"
    .pokemon_cache$dat <- arrow::read_csv_arrow(path)
  }
  .pokemon_cache$dat
}


# load_data <- function() {
#
#   path <- "https://www.dropbox.com/scl/fi/tnl4wcmgduu3bnmmllz2u/pokemon_cards.csv?rlkey=h7evg3hr4ckzqrxrzoy458ojs&st=uzrlktbc&dl=1"
#   arrow::read_csv_arrow(path)
#
# }
