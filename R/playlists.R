#' Get a List of a User’s Playlists
#' Get a list of the playlists owned or followed by a Spotify user
#'
#' For more information: https://developer.spotify.com/web-api/get-list-users-playlists/
get_user_playlists <- function(user_id,...){

  response <- GET(url = paste(user_url,'/',user_id,'/playlists',sep=''),
                  query=list(...),
                  add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(response)
}


#' Get a Playlist
#' Get a playlist owned by a Spotify user.
#'
#' For more information: https://developer.spotify.com/web-api/get-playlist/
get_playlist <- function(user_id,playlist_id,...){

  response <- GET(url = paste(user_url,'/',user_id,'/playlists/',playlist_id,sep=''),
                  query=list(...),
                  add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(response)
}


#' Get a Playlist’s Tracks
#' Get full details of the tracks of a playlist owned by a Spotify user.
#'
#' For more information: https://developer.spotify.com/web-api/get-playlist/
get_playlist_tracks <- function(user_id,playlist_id,...){

  response <- GET(url = paste(user_url,'/',user_id,'/playlists/',playlist_id,'/tracks/',sep=''),
                  query=list(...),
                  add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(response)
}


#' Create a Playlist
#' Create a playlist for a Spotify user. (The playlist will be empty until you add tracks.)
#'
#' For more information: https://developer.spotify.com/web-api/create-playlist/
create_playlist <- function(user_id,name,...){

  response <- POST(url = paste(user_url,'/',user_id,'/playlists',sep=''),
                  body=list(name=name,...),
                  add_headers(Authorization=paste('Bearer',access_token),
                              'Content-Type'='application/json'),
                  encode='json')
  get_response_content(response)
}


#' Add Tracks to a Playlist
#' Add one or more tracks to a users playlist
#'
#' For more information: https://developer.spotify.com/web-api/add-tracks-to-playlist/
add_tracks_to_playlist <- function(user_id,playlist_id,uris){

  response <- POST(url = paste(user_url,'/',user_id,'/playlists/',playlist_id,'/tracks',sep=''),
                   body=list(uris),
                   add_headers(Authorization=paste('Bearer',access_token),
                               'Content-Type'='application/json'),
                   encode='json')
  get_response_content(response)
}






#####################


#' Remove Tracks from a Playlist
#' Remove one or more tracks from a user’s playlist.
#'
#' For more information: https://developer.spotify.com/web-api/remove-tracks-playlist/
remove_tracks_from_playlist <- function(user_id,playlist_id,tracks){

  ## DOES NOT WORK

  response <- DELETE(url = paste(user_url,'/',user_id,'/playlists/',playlist_id,'/tracks',sep=''),
                   body=list(tracks=data.frame(uri=uris)),
                   # body=list('tracks'=data.frame(uri='6NwbeybX6TDtXlpXvnUOZC')),
                   # body=list('tracks'=test_id),
                   add_headers(Authorization=paste('Bearer',access_token)),
                   # encode='json',
                   accept_json(),
                   verbose())
  get_response_content(response)
}

