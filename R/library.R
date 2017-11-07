#' Save Tracks for User
#' Save one or more tracks to the current user’s “Your Music” library
#'
#' @references \href{https://developer.spotify.com/web-api/save-tracks-user/}{API documentation}
#'
#' @param ids
#'
#' @export
#'
#' @examples
#' set_tokens()
#' user_auth()
#' save_track(ids=c('4iV5W9uYEdYUVa79Axb7Rh', '4iV5W9uYEdYUVa79Axb7Rh'))
#' save_track(ids='4iV5W9uYEdYUVa79Axb7Rh')
save_track <- function(ids,...){

  #TODO: fix this hack
  if (length(ids) == 1) {
    payload_ids <- glue('{{"ids": ["{ids}"]}}')
  } else {
    payload_ids = list(ids = ids)
  }

  response <- PUT(LIBRARY_URL,
                  config(token = user_token),
                  body = payload_ids,
                  encode = 'json')
  get_response_content(response)

}


#' Get a User’s Saved Tracks
#' Get a list of the songs saved in the current Spotify user’s “Your Music” library.
#'
#' @references \href{https://developer.spotify.com/web-api/get-users-saved-tracks/}{API documentation}
#'
#' @param ids
#'
#' @export
#'
#' @examples
#' set_tokens()
#' user_auth()
#' get_saved_tracks()
get_saved_tracks <- function(...){

  response <- GET(LIBRARY_URL,
                  config(token = user_token),
                  query=list(...))
  get_response_content(response)
}


#' Remove User’s Saved Tracks
#' Remove one or more tracks from the current user’s “Your Music” library
#'
#' @references \href{https://developer.spotify.com/web-api/remove-tracks-user/}{API documentation}
#'
#' @param ids
#'
#' @export
#'
#' @examples
#' set_tokens()
#' user_auth()
#' remove_track(ids=c('4iV5W9uYEdYUVa79Axb7Rh'))
remove_track <- function(ids,...){
  response <- DELETE(LIBRARY_URL,
                     config(token = user_token),
                     query = list(ids = ids))
  get_response_content(response)
}


#' Check User’s Saved Tracks
#' Check if one or more tracks is already saved in the current Spotify user’s “Your Music” library.
#'
#' @references \href{https://developer.spotify.com/web-api/get-users-saved-tracks/}{API documentation}
#'
#' @param ids
#'
#' @export
#'
#' @examples
#' set_tokens()
#' user_auth()
#' check_saved_tracks(ids=c('4iV5W9uYEdYUVa79Axb7Rh'))
check_saved_tracks <- function(ids,...){
  response <- GET(url = glue('{LIBRARY_URL}/contains'),
                  config(token = user_token),
                  query = list(ids = ids))
  get_response_content(response)
}

