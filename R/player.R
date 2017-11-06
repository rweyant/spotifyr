#' Get a User’s Available Devices
#' Get information about a user’s available devices.
#'
#' @references \href{https://developer.spotify.com/web-api/get-a-users-available-devices/}{API documentation}
#'
#' @examples
#' set_tokens()
#' user_auth()
#' get_user_devices()
get_user_devices <- function(){
  response <- GET(url = glue('{PLAYER_URL}/devices'),
                  config(token = user_token))
  get_response_content(response)
}

#' Get Information About The User’s Current Playback
#' Get information about the user’s current playback state, including track, track progress, and active device.
#'
#' @references \href{https://developer.spotify.com/web-api/get-information-about-the-users-current-playback/}{API documentation}
#'
#' @examples
#' set_tokens()
#' user_auth()
#' get_user_playback()
get_user_playback <- function(){
  response <- GET(url = glue('{PLAYER_URL}'),
                  config(token = user_token))
  get_response_content(response)
}

#' Get the User’s Currently Playing Track
#' Get the object currently being played on the user’s Spotify account.
#'
#' @references \href{https://developer.spotify.com/web-api/get-the-users-currently-playing-track/}{API documentation}
#'
#' @examples
#' set_tokens()
#' user_auth()
#' get_currently_playing_track()
get_currently_playing_track <- function(){
  response <- GET(url = glue('{PLAYER_URL}/currently-playing'),
                  config(token = user_token))
  get_response_content(response)
}


#' Transfer a User’s Playback
#' Transfer playback to a new device and determine if it should start playing
#'
#' @references \href{https://developer.spotify.com/web-api/transfer-a-users-playback/}{API documentation}
#'
#' @examples
#' set_tokens()
#' user_auth()
#' transfer_user_playback(device_ids = '7c9c590cb73f430fa049c1ccbd5be87334580827')
transfer_user_playback <- function(device_ids, play = TRUE){
  payload <- glue('{{"device_ids": ["{device_ids}"]}}')
  response <- PUT(url = glue('{PLAYER_URL}'),
                  config(token = user_token),
                  body = payload,
                  verbose())
  get_response_content(response)
}



#' Pause a User’s Playback
#' Pause playback on the user’s account.
#'
#' @references \href{https://developer.spotify.com/web-api/pause-a-users-playback/}{API documentation}
#' @param device_id Optional. The id of the device this command is targeting. If not supplied, the user's currently active device is the target
#'
#' @examples
#' set_tokens()
#' user_auth()
#' pause_user_playback()
pause_user_playback <- function(device_id = NULL){
  if (!is.null(device_id)) warning('device_id argument not supported yet.')
  response <- PUT(url = glue('{PLAYER_URL}/pause'),
                  config(token = user_token))
  get_response_content(response)
}


#' Start/Resume a User’s Playback
#' Start a new context or resume current playback on the user’s active device.
#'
#' @references \href{https://developer.spotify.com/web-api/start-a-users-playback/}{API documentation}
#'
#' @examples
#' set_tokens()
#' user_auth()
#' start_user_playback()
start_user_playback <- function(device_ids = NULL, play = TRUE){
  if (!is.null(device_id)) warning('device_id argument not supported yet.')
  response <- PUT(url = glue('{PLAYER_URL}/play'),
                  config(token = user_token))
  get_response_content(response)
}


#' Skip User’s Playback To Next Track
#' Skips to next track in the user’s queue.
#'
#' @references \href{https://developer.spotify.com/web-api/skip-users-playback-to-next-track/}{API documentation}
#' @param device_id Optional. The id of the device this command is targeting. If not supplied, the user's currently active device is the target
#'
#' @examples
#' set_tokens()
#' user_auth()
#' skip_user_playback_next()
skip_user_playback_next <- function(device_id = NULL){
  if (!is.null(device_id)) warning('device_id argument not supported yet.')
  response <- POST(url = glue('{PLAYER_URL}/next'),
                  config(token = user_token))
  get_response_content(response)
}

#' Skip User’s Playback To Previous Track
#' Skips to previous track in the user’s queue.
#'
#' @references \href{https://developer.spotify.com/web-api/skip-users-playback-to-previous-track/}{API documentation}
#' @param device_id Optional. The id of the device this command is targeting. If not supplied, the user's currently active device is the target
#'
#' @examples
#' set_tokens()
#' user_auth()
#' skip_user_playback_previous()
skip_user_playback_previous <- function(device_id = NULL){
  if (!is.null(device_id)) warning('device_id argument not supported yet.')
  response <- POST(url = glue('{PLAYER_URL}/previous'),
                   config(token = user_token))
  get_response_content(response)
}


#' Seek To Position In Currently Playing Track
#' Seeks to the given position in the user’s currently playing track.
#'
#' @references \href{https://developer.spotify.com/web-api/seek-to-position-in-currently-playing-track/}{API documentation}
#'
#' @param position_ms Required. The position in milliseconds to seek to. Must be a positive number. Passing in a position that is greater than the length of the track will cause the player to start playing the next song.
#' @param device_id Optional. The id of the device this command is targeting. If not supplied, the user's currently active device is the target
#'
#' @examples
#' set_tokens()
#' user_auth()
#' seek_user_playback(position_ms = 1000)
seek_user_playback <- function(position_ms, device_id = NULL){
  if (!is.null(device_id)) warning('device_id argument not supported yet.')
  response <- PUT(url = glue('{PLAYER_URL}/seek'),
                  config(token = user_token),
                  query=list(position_ms=position_ms))
  get_response_content(response)
}
