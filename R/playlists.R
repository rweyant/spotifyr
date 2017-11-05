#' Get a List of a User’s Playlists
#' Get a list of the playlists owned or followed by a Spotify user
#'
#' @references \href{https://developer.spotify.com/web-api/get-list-users-playlists/}{API documentation}
#'
#' @param user_id
#'
#' @examples
#' set_tokens()
#' get_user_playlists(user_id = 'rweyant')
get_user_playlists <- function(user_id, ...){
  response <- GET(url = glue('{USER_URL}/{user_id}/playlists'),
                  add_headers(Authorization = glue('Bearer {access_token}')),
                  query=list(...))
  get_response_content(response)
}


#' Get a Playlist
#' Get a playlist owned by a Spotify user.
#'
#' @references \href{https://developer.spotify.com/web-api/get-playlist/}{API documentation}
#'
#' @param user_id
#' @param playlist_id
#'
#' @examples
#' set_tokens()
#' get_playlist(user_id = 'spotify', playlist_id = '59ZbFPES4DQwEjBpWHzrtC')
get_playlist <- function(user_id, playlist_id,...){
  response <- GET(url = glue('{USER_URL}/{user_id}/playlists/{playlist_id}'),
                  add_headers(Authorization = glue('Bearer {access_token}')),
                  query = list(...))
  get_response_content(response)
}


#' Get a Playlist’s Tracks
#' Get full details of the tracks of a playlist owned by a Spotify user.
#'
#' @references \href{https://developer.spotify.com/web-api/get-playlists-tracks/}{API documentation}
#'
#' @param user_id
#' @param playlist_id
#'
#' @examples
#' set_tokens()
#' get_playlist_tracks(user_id = 'spotify', playlist_id = '59ZbFPES4DQwEjBpWHzrtC')
get_playlist_tracks <- function(user_id,playlist_id,...){
  response <- GET(url = glue('{USER_URL}/{user_id}/playlists/{playlist_id}/tracks/'),
                  add_headers(Authorization = glue('Bearer {access_token}')),
                  query = list(...))
  get_response_content(response)
}


#' Create a Playlist
#' Create a playlist for a Spotify user. (The playlist will be empty until you add tracks.)
#'
#' @references \href{https://developer.spotify.com/web-api/create-playlist/}{API documentation}
#'
#' @param user_id
#' @param name
#'
#' @examples
#' set_tokens()
#' user_auth()
#' create_playlist(user_id = 'rweyant', name = 'spotifyr-test')
create_playlist <- function(user_id, name,...){
  response <- POST(url = glue('{USER_URL}/{user_id}/playlists/'),
                   config(token = user_token),
                   body = list(name = name,...),
                   encode = 'json')
  get_response_content(response)
}


#' Add Tracks to a Playlist
#' Add one or more tracks to a users playlist
#'
#' @references \href{https://developer.spotify.com/web-api/add-tracks-to-playlist/}{API documentation}
#'
#' @param user_id
#' @param name
#' @param uris
#'
#' @examples
#' set_tokens()
#' user_auth()
#' add_tracks_to_playlist(user_id = 'rweyant', playlist_id = '4Ej1T0FVGBCmwXapPGK2eP', uris = 'spotify:track:4S47FRAZ3VcyZS87FnQtmk')
#' add_tracks_to_playlist(user_id = 'rweyant',
#'                        playlist_id = '4Ej1T0FVGBCmwXapPGK2eP',
#'                        uris = c('spotify:track:4S47FRAZ3VcyZS87FnQtmk', 'spotify:track:3MXA2BkBk0lSuMpRoM7SK2'))
add_tracks_to_playlist <- function(user_id, playlist_id, uris){

  # TODO fix this hack
  if (length(uris) == 1) {
    payload_uris <- glue('{{"uris": ["{uris}"]}}')
  } else {
    payload_uris = list(uris = uris)
  }

  response <- POST(url = glue('{USER_URL}/{user_id}/playlists/{playlist_id}/tracks'),
                   config(token = user_token),
                   body = payload_uris,
                   encode = 'json')
  get_response_content(response)
}

#' Remove Tracks from a Playlist
#' Remove one or more tracks from a user’s playlist.
#'
#' @references \href{https://developer.spotify.com/web-api/remove-tracks-playlist/}{API documentation}
#'
#' @param user_id
#' @param playlist_id
#' @param uris
#'
#' @examples
#' set_tokens()
#' user_auth()
#' remove_tracks_from_playlist(user_id = 'rweyant', playlist_id = '4Ej1T0FVGBCmwXapPGK2eP', uris = 'spotify:track:4S47FRAZ3VcyZS87FnQtmk')
#' remove_tracks_from_playlist(user_id = 'rweyant',
#'                             playlist_id = '4Ej1T0FVGBCmwXapPGK2eP',
#'                             uris = c('spotify:track:4S47FRAZ3VcyZS87FnQtmk', 'spotify:track:3MXA2BkBk0lSuMpRoM7SK2'))
remove_tracks_from_playlist <- function(user_id,playlist_id, uris){

  response <- DELETE(url = glue('{USER_URL}/{user_id}/playlists/{playlist_id}/tracks'),
                     config(token = user_token),
                     body = list(tracks = data.frame(uri = uris)),
                     encode = 'json',
                     verbose())

  get_response_content(response)
}

