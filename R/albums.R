
#' Get an Album
#' Get Spotify catalog information for a single album
#'
#' @references \href{https://developer.spotify.com/web-api/get-album/}{API documentation}
#'
#' @param id Required. The Spotify ID for the album
#'
#' @export
#'
#' @examples
#' set_tokens()
#' get_album('0sNOF9WDwhWunNAHPD3Baj')
#' get_album('0sNOF9WDwhWunNAHPD3Baj', market='IS')
get_album <- function(id,...){
  response <- GET(url = glue('{ALBUMS_URL}/{id}'),
                add_headers(Authorization = glue('Bearer {access_token}')),
                query = list(...))
  get_response_content(response)
}

#' Get Several Albums
#' Get Spotify catalog information for multiple albums identified by their Spotify IDs.
#'
#' @references \href{https://developer.spotify.com/web-api/get-several-album/}{API documentation}
#'
#' @param ids Required. A comma-separated list of the Spotify IDs for the albums. Maximum: 20 IDs.
#'
#' @export
#'
#' @examples
#' set_tokens()
#' get_albums(ids = c('41MnTivkwTO3UUJ8DrqEJJ', '6JWc4iAiJ9FjyK0B59ABb4', '6UXCm6bOO4gFlDQZV5yL37'))
#' get_albums(ids = c('41MnTivkwTO3UUJ8DrqEJJ', '6JWc4iAiJ9FjyK0B59ABb4', '6UXCm6bOO4gFlDQZV5yL37'), market='US')
get_albums <- function(ids,...){
  query <- list(ids = paste(ids, collapse=','), ...)
  response <- GET(url = ALBUMS_URL,
                add_headers(Authorization = glue('Bearer {access_token}')),
                query = query)
  get_response_content(response)
}

#' Get an Album’s Tracks
#' Get Spotify catalog information about an album’s tracks.
#' Optional parameters can be used to limit the number of tracks returned.
#'
#' @references \href{https://developer.spotify.com/web-api/get-albums-tracks/}{API documentation}
#'
#' @export
#'
#' @param id Required. The Spotify ID for the album
#'
#' @examples
#' set_tokens()
#' get_album_tracks('6akEvsycLGftJxYudPjmqK')
#' get_album_tracks('6akEvsycLGftJxYudPjmqK', limit = 2)
get_album_tracks <- function(id,...){
  response <- GET(url = glue('{ALBUMS_URL}/{id}/tracks'),
                add_headers(Authorization = glue('Bearer {access_token}')),
                query=list(...))
  get_response_content(response)
}
