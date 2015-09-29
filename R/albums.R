
#' Get an Album
#' Get Spotify catalog information for a single album
#' @param id Required. The Spotify ID for the album
#'
#' For more information: https://developer.spotify.com/web-api/get-album/
get_album <- function(id,...){
  search <- GET(url = paste(albums_url,'/',id,sep=''))
  response <- content(search)
  response
}
