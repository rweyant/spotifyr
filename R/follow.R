#' Get User’s Followed Artists
#' Get the current user’s followed artists.
#'
#' @references \href{https://developer.spotify.com/web-api/get-followed-artists/}{API documentation}
#'
#' @export
#'
#' @examples
#' set_tokens()
#' user_auth()
#' get_user_followed_artists()
get_user_followed_artists <- function(...){
  response <- GET(url = FOLLOWING_URL,
                  config(token = user_token),
                  query = list(type = 'artist'))
  get_response_content(response)
}

#' Follow Artists or Users
#' Add the current user as a follower of one or more artists or other Spotify users.
#'
#' @references \href{https://developer.spotify.com/web-api/follow-artists-users/}{API documentation}
#'
#' @param type Required. The ID type: either artist or user.
#' @param ids Optional. A comma-separated list of the artist or the user Spotify IDs.
#'
#' @export
#'
#' @examples
#' set_tokens()
#' user_auth()
#' follow('08td7MxkoHQkXnWAYD8d6Q', type='artist')
follow <- function(ids, type = c('artist', 'user'), ...){
  type <- match.arg(type)
  response <- PUT(FOLLOWING_URL,
                  config(token = user_token),
                  query = list(type=type, ids=ids))
  get_response_content(response)
}

#' Unfollow Artists or Users
#' Remove the current user as a follower of one or more artists or other Spotify users
#'
#' @references \href{https://developer.spotify.com/web-api/unfollow-artists-users/}{API documentation}
#'
#' @param type Required. The ID type: either artist or user.
#' @param ids Optional. A comma-separated list of the artist or the user Spotify IDs.
#'
#' @export
#'
#' @examples
#' set_tokens()
#' user_auth()
#' unfollow('08td7MxkoHQkXnWAYD8d6Q', type='artist')
unfollow <- function(ids, type = c('artist','user'), ...){
  type <- match.arg(type)
  response <- DELETE(FOLLOWING_URL,
                     config(token = user_token),
                     query = list(type=type, ids=ids),
                     encode = 'json')
  get_response_content(response)
}


#' Check if Current User Follows Artists or Users
#' Check to see if the current user is following one or more artists or other Spotify users
#'
#' @references \href{https://developer.spotify.com/web-api/check-current-user-follows/}{API documentation}
#'
#' @param type Required. The ID type: either artist or user.
#' @param ids Optional. A comma-separated list of the artist or the user Spotify IDs.
#'
#' @export
#'
#' @examples
#' set_tokens()
#' user_auth()
#' following(ids=c('08td7MxkoHQkXnWAYD8d6Q', '74ASZWbe4lXaubB36ztrGX'), type='artist')
following <- function(ids, type=c('artist', 'user'), ...){
  type <- match.arg(type)
  ids <- paste(ids, collapse = ',')
  response <- GET(glue('{FOLLOWING_URL}/contains'),
                  config(token = user_token),
                  query = list(type = type, ids = ids))
  get_response_content(response)
}

#' Follow a Playlist Add the current user as a follower of a playlist
#'
#' @references \href{https://developer.spotify.com/web-api/follow-playlist/}{API
#'   documentation}
#'
#' @param owner_id The Spotify user ID of the person who owns the playlist.
#' @param playlist_id The Spotify ID of the playlist. Any playlist can be
#'   followed, regardless of its public/private status, as long as you know its
#'   playlist ID.
#' @param public Optional, default true. If true the playlist will be included
#'   in user's public playlists, if false it will remain private. To be able to
#'   follow playlists privately, the user must have granted the
#'   playlist-modify-private scope.
#'
#' @export
#'
#' @examples
#' set_tokens()
#' user_auth()
#' follow_playlist(owner_id = 'jmperezperez', playlist_id = '2v3iNvBX8Ay1Gt2uXtUKUT')
follow_playlist <- function(owner_id, playlist_id, public = TRUE, ...){
  response <- PUT(glue('{USER_URL}/{owner_id}/playlists/{playlist_id}/followers'),
                  config(token = user_token),
                  body = list(public = public))
  get_response_content(response)
}


#' Unfollow a Playlist Remove the current user as a follower of a playlist.
#'
#' @references
#'   \href{https://developer.spotify.com/web-api/unfollow-playlist/}{API
#'   documentation}
#'
#' @param owner_id The Spotify user ID of the person who owns the playlist.
#' @param playlist_id The Spotify ID of the playlist. Any playlist can be
#'   followed, regardless of its public/private status, as long as you know its
#'   playlist ID.
#'
#' @export
#'
#' @examples
#' set_tokens()
#' user_auth()
#' unfollow_playlist(owner_id = 'jmperezperez', playlist_id = '2v3iNvBX8Ay1Gt2uXtUKUT')
unfollow_playlist <- function(owner_id, playlist_id, ...){
  response <- DELETE(glue('{USER_URL}/{owner_id}/playlists/{playlist_id}/followers'),
                     config(token = user_token))
  get_response_content(response)
}

#' Check if Users Follow a Playlist Check to see if one or more Spotify users
#' are following a specified playlist.
#'
#' @references
#'   \href{https://developer.spotify.com/web-api/check-user-following-playlist/}{API
#'   documentation}
#'
#' @param owner_id The Spotify user ID of the person who owns the playlist.
#' @param playlist_id The Spotify ID of the playlist. Any playlist can be
#'   followed, regardless of its public/private status, as long as you know its
#'   playlist ID.
#' @param ids Required. A comma-separated list of Spotify User IDs; the ids of
#'   the users that you want to check to see if they follow the playlist.
#'   Maximum: 5 ids.
#'
#' @export
#'
#' @examples
#' set_tokens()
#' user_auth()
#' following_playlist(owner_id = 'jmperezperez', playlist_id = '2v3iNvBX8Ay1Gt2uXtUKUT', ids='rweyant')
following_playlist <- function(owner_id, playlist_id, ids,...){
  response <- GET(glue('{USER_URL}/{owner_id}/playlists/{playlist_id}/followers/contains'),
                  config(token = user_token),
                  body = list(public = public),
                  query = list(ids = paste(ids, collapse = ',')))
  unlist(get_response_content(response))
}

