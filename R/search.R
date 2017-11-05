#' Get Spotify catalog information about artists, albums,
#' tracks or playlists that match a keyword string.
#'
#' @param q Required. The search query's keywords
#' (and optional field filters and operators)
#' @param type A comma-separated list of item types
#' to search across. Valid types are: album, artist,
#' playlist, and track
#'
#' @references \href{https://developer.spotify.com/web-api/search-item/}{API documentation}
#'
#' @examples
#' set_tokens()
#' search(q = 'heavy metal', type = 'track')
search <- function(q, type = c('artist', 'album', 'playlist', 'track'), ...){
  type <- match.arg(type)
  response <- GET(url = SEARCH_URL,
                  add_headers(Authorization = glue('Bearer {access_token}')),
                  query = list(q = q, type = type,...))
  get_response_content(response)
}

