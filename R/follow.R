#' Get User’s Followed Artists
#' Get the current user’s followed artists.
#'
#' For more information: https://developer.spotify.com/web-api/get-followed-artists/
get_user_followed_artists <- function(access_token=NULL,...){
  ## Credentials not right -- need user creds.
  if(is.null(access_token)) access_token <- get_tokens()$access_token

  response <- GET(url = following_url,
                query=list(type='artist'),
                add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(response)
}

#' Follow Artists or Users
#' Add the current user as a follower of one or more artists or other Spotify users.
#'
#' For more information: https://developer.spotify.com/web-api/follow-artists-users/
follow <- function(ids,type=c('artist','user'),access_token=NULL,...){

  ## Credentials not right -- need user creds.
  if(is.null(access_token)) access_token <- get_tokens()$access_token

  response <- PUT(url = paste(following_url,'?type=',type,'&ids=',paste(ids,collapse=','),sep=''),
                  # body=list(...),
                  add_headers(Authorization=paste('Bearer',access_token),
                              'Content-Type'='application/json'))
  get_response_content(response)
}

#' Unfollow Artists or Users
#' Remove the current user as a follower of one or more artists or other Spotify users
#'
#' For more information: https://developer.spotify.com/web-api/unfollow-artists-users/
unfollow <- function(ids,type=c('artist','user'),access_token=NULL,...){

  ## Credentials not right -- need user creds.
  if(is.null(access_token)) access_token <- get_tokens()$access_token

  response <- DELETE(url = paste(following_url,'?type=',type,'&ids=',paste(ids,collapse=','),sep=''),
                  # body=list(...),
                  add_headers(Authorization=paste('Bearer',access_token),
                              'Content-Type'='application/json'))
  get_response_content(response)
}



#' Check if Current User Follows Artists or Users
#' Check to see if the current user is following one or more artists or other Spotify users
#'
#' For more information: https://developer.spotify.com/web-api/check-current-user-follows/
following <- function(ids,type=c('artist','user'),access_token=NULL,...){
  ## Credentials not right -- need user creds.
  if(is.null(access_token)) access_token <- get_tokens()$access_token

  response <- GET(url = paste(following_url,'/contains',sep=''),
                  query=list(type=type,ids=ids),
                  add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(response)
}

#' Follow a Playlist
#' Add the current user as a follower of a playlist
#'
#' For more information: https://developer.spotify.com/web-api/follow-playlist/
follow_playlist <- function(owner_id,playlist_id,access_token=NULL,...){
  ## Credentials not right -- need user creds.
  if(is.null(access_token)) access_token <- get_tokens()$access_token

  response <- PUT(url = paste(base_url,'/v1/users/',owner_id,'/playlists/',playlist_id,'/followers',sep=''),
                  # body=list(...),
                  add_headers(Authorization=paste('Bearer',access_token),
                              'Content-Type'='application/json'))
  get_response_content(response)
}







#######


