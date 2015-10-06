#' Save Tracks for User
#' Save one or more tracks to the current user’s “Your Music” library
#'
#' For more information: https://developer.spotify.com/web-api/save-tracks-user/
save_track <- function(ids,...){

  response <- PUT(url = library_url,
                  body=list(ids),
                  add_headers(Authorization=paste('Bearer',access_token),
                              'Content-Type'='application/json'),
                  encode='json')
  get_response_content(response)
}


#' Get a User’s Saved Tracks
#' Get a list of the songs saved in the current Spotify user’s “Your Music” library.
#'
#' For more information: https://developer.spotify.com/web-api/get-users-saved-tracks/
get_saved_tracks <- function(...){

  response <- GET(url = library_url,
                  query=list(...),
                  add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(response)
}


#' Remove User’s Saved Tracks
#' Remove one or more tracks from the current user’s “Your Music” library
#'
#' For more information: https://developer.spotify.com/web-api/remove-tracks-user/
remove_track <- function(ids,...){

  response <- DELETE(url = paste(library_url,'/?ids=',paste(ids,collapse=','),sep=''),
                     add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(response)
}


#' Check User’s Saved Tracks
#' Check if one or more tracks is already saved in the current Spotify user’s “Your Music” library.
#'
#' For more information: https://developer.spotify.com/web-api/get-users-saved-tracks/
check_saved_tracks <- function(ids,...){

  response <- GET(url = paste(library_url,'/contains',sep=''),
                  query=list(ids=ids),
                  add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(response)
}

