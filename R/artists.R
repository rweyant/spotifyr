#' Get an Artist
#' Get Spotify catalog information for a single artist identified by their unique Spotify ID.
#' @param id Required. The Spotify ID for the album
#'
#' For more information: https://developer.spotify.com/web-api/get-artist/
get_artist <- function(id){
  search <- GET(url = paste(artists_url,id,sep=''))
  check_status_code(status_code(search))
  response <- content(search)
  response
}

#' Get Several Artists
#' Get Spotify catalog information for several artists based on their Spotify IDs.
#' @param ids Required. A comma-separated list of the Spotify IDs for the artists. Maximum: 50 IDs.
#'
#' For more information: https://developer.spotify.com/web-api/get-several-albums/
get_artists <- function(ids){
  query <- list(ids=paste(ids,collapse=','))
  search <- GET(url = artists_url,query=query)
  check_status_code(status_code(search))
  response <- content(search)
  response
}


#' Get an Artist’s Albums
#' Get Spotify catalog information about an artist’s albums.
#' Optional parameters can be specified in the query string to
#' filter and sort the response.
#' @param id Required. The Spotify ID for the artist
#'
#' For more information: https://developer.spotify.com/web-api/get-albums-tracks/
get_artist_albums <- function(id,...){
  search <- GET(url = paste(artists_url,id,'/albums',sep=''),query=list(...))
  check_status_code(status_code(search))
  response <- content(search)
  response
}

#' Get an Artist’s Top Tracks
#' Get Spotify catalog information about an artist’s top tracks by country.
#' filter and sort the response.
#' @param id Required. The Spotify ID for the artist
#'
#' For more information: https://developer.spotify.com/web-api/get-artists-top-tracks/
get_artist_toptracks <- function(id,country){
  search <- GET(url = paste(artists_url,id,'/top-tracks',sep=''),query=list(country=country))
  check_status_code(status_code(search))
  response <- content(search)
  response
}
