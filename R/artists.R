#' @title Get an Artist
#'
#' @description Get Spotify catalog information for a single artist identified by their unique Spotify ID.
#'
#' @references \href{https://developer.spotify.com/web-api/get-artist/}{API documentation}
#'
#' @export
#'
#' @param id Required. The Spotify ID for the album
#'
#' @return Spotify Artist object
#'
#' @examples
#' set_tokens()
#' get_artist('42ZTPxJukaCRQuMjmxVJo4')
get_artist <- function(id, ...){
  response <- httr::GET(url = glue('{ARTIST_URL}/{id}'),
                        add_headers(Authorization = glue('Bearer {access_token}')))
  get_response_content(response)
}

#' Get Several Artists
#'
#' Get Spotify catalog information for several artists based on their Spotify IDs.
#'
#' @references \href{https://developer.spotify.com/web-api/get-several-artists/}{API documentation}
#'
#' @export
#'
#' @param ids Required. A comma-separated list of the Spotify IDs for the artists. Maximum: 50 IDs.
#'
#' @examples
#' get_artists(c('0oSGxfWSnnOXhD2fKuz2Gy','3dBVyJ7JuOMt4GE9607Qin'))
get_artists <- function(ids, ...){
  query <- list(ids = paste(ids, collapse=','), ...)
  response <- httr::GET(url = ARTIST_URL,
                        add_headers(Authorization = glue('Bearer {access_token}')),
                        query = query)
  get_response_content(response)
}


#' Get an Artist’s Albums
#' Get Spotify catalog information about an artist’s albums.
#' Optional parameters can be specified in the query string to
#' filter and sort the response.
#'
#' @references \href{https://developer.spotify.com/web-api/get-artists-albums/}{API documentation}
#'
#' @export
#'
#' @param id Required. The Spotify ID for the artist
#' @examples
#' set_tokens()
#' get_artist_albums('1vCWHaC5f2uS3yhpwWbIA6')
get_artist_albums <- function(id, ...){
  response <- httr::GET(url = glue('{ARTIST_URL}/{id}/albums'),
                        add_headers(Authorization = glue('Bearer {access_token}')),
                        query = list(...))

  get_response_content(response)
}

#' Get an Artist’s Top Tracks
#' Get Spotify catalog information about an artist’s top tracks by country.
#' filter and sort the response.
#'
#' @references \href{https://developer.spotify.com/web-api/get-artists-top-tracks/}{API documentation}
#'
#' @export
#'
#' @param id Required. The Spotify ID for the artist
#' @examples
#' set_tokens()
#' get_artist_toptracks('1vCWHaC5f2uS3yhpwWbIA6')
#' get_artist_toptracks('1vCWHaC5f2uS3yhpwWbIA6', 'DE')
get_artist_toptracks <- function(id, country = 'US'){
  response <- httr::GET(url = glue('{ARTIST_URL}/{id}/top-tracks'),
                        add_headers(Authorization = glue('Bearer {access_token}')),
                        query = list(country = country))
  get_response_content(response)
}


#' Get an Artist’s Related Artists
#' Get Spotify catalog information about artists similar to a given artist.
#' Similarity is based on analysis of the Spotify community’s listening history.
#'
#' @references \href{https://developer.spotify.com/web-api/get-related-artists/}{API documentation}
#'
#' @export
#'
#' @param id Required. The Spotify ID for the artist
#' @examples
#' set_tokens()
#' get_artist_relatedartists('1vCWHaC5f2uS3yhpwWbIA6')
get_artist_relatedartists <- function(id, ...){
  response <- httr::GET(url = glue('{ARTIST_URL}/{id}/related-artists'),
                        add_headers(Authorization = glue('Bearer {access_token}')),
                        query = list(...))
  get_response_content(response)
}


