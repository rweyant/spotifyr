#' Get a Track
#' Get Spotify catalog information for a single track identified by its unique Spotify ID.
#'
#' @references \href{https://developer.spotify.com/web-api/get-track/}{API documentation}
#'
#' @param id
#'
#' @export
#'
#' @examples
#' set_tokens()
#' get_track(id='3n3Ppam7vgaVa1iaRUc9Lp')
get_track <- function(id,...){

  response <- GET(glue('{TRACKS_URL}/{id}'),
                  add_headers(Authorization = glue('Bearer {access_token}')))
  get_response_content(response)

}

#' Get Several Tracks
#' Get Spotify catalog information for multiple tracks based on their Spotify IDs.
#'
#' @references \href{https://developer.spotify.com/web-api/get-several-tracks/}{API documentation}
#'
#' @param ids A comma-separated list of the Spotify IDs for the tracks. Maximum: 50 IDs.
#'
#' @export
#'
#' @examples
#' set_tokens()
#' get_tracks(ids='3n3Ppam7vgaVa1iaRUc9Lp')
#' get_tracks(ids=c('3n3Ppam7vgaVa1iaRUc9Lp', '3twNvmDtFQtAd5gMKedhLD'))
get_tracks <- function(ids,...){
  query <- list(ids = paste(ids, collapse = ','), ...)
  response <- GET(TRACKS_URL,
                  add_headers(Authorization = glue('Bearer {access_token}')),
                  query = query)
  get_response_content(response)

}


#' Get Audio Analysis for a Track
#' Get a detailed audio analysis for a single track identified by its unique Spotify ID.
#'
#' @references \href{https://developer.spotify.com/web-api/get-audio-analysis/}{API documentation}
#'
#' @param id Required. The Spotify ID for the track.
#'
#' @export
#'
#' @examples
#' set_tokens()
#' get_track_audio_analysis(id='3n3Ppam7vgaVa1iaRUc9Lp')
get_track_audio_analysis <- function(id, ...){
  response <- GET(glue('{AUDIO_ANALYSIS_URL}/{id}'),
                  add_headers(Authorization = glue('Bearer {access_token}')))
  get_response_content(response)

}


#' Get Audio Features for a Track
#' Get audio feature information for a single track identified by its unique Spotify ID.
#'
#' @references \href{https://developer.spotify.com/web-api/get-audio-features/}{API documentation}
#'
#' @param id Required. The Spotify ID for the track.
#'
#' @export
#'
#' @examples
#' set_tokens()
#' get_track_audio_features(id='3n3Ppam7vgaVa1iaRUc9Lp')
get_track_audio_features <- function(id, ...){
  response <- GET(glue('{AUDIO_FEATURES_URL}/{id}'),
                  add_headers(Authorization = glue('Bearer {access_token}')))
  get_response_content(response)
}


#' Get Audio Features for Several Tracks
#' Get audio features for multiple tracks based on their Spotify IDs.
#'
#' @references \href{https://developer.spotify.com/web-api/get-several-audio-features/}{API documentation}
#'
#' @param ids Required. A comma-separated list of the Spotify IDs for the tracks. Maximum: 100 IDs.
#'
#' @export
#'
#' @examples
#' set_tokens()
#' get_tracks_audio_features(ids=c('3n3Ppam7vgaVa1iaRUc9Lp', '3twNvmDtFQtAd5gMKedhLD'))
get_tracks_audio_features <- function(ids, ...){
  query <- list(ids = paste(ids, collapse = ','), ...)
  response <- GET(AUDIO_FEATURES_URL,
                  add_headers(Authorization = glue('Bearer {access_token}')),
                  query = query)
  get_response_content(response)
}
