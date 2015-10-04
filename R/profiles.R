#' Get a User’s Profile
#' Get public profile information about a Spotify user
#'
#' For more information: https://developer.spotify.com/web-api/get-users-profile/
get_user_profile <- function(user_id){
  response <- GET(url = paste(user_url,'/',user_id,sep=''))
  get_response_content(response)
}


#' Get Current User’s Profile
#' Get detailed profile information about the current user (including the current user’s username).
#' For more information: https://developer.spotify.com/web-api/get-playlist/
get_current_user_profile <- function(){
  response <- GET(url = paste(base_url,'/v1/me/',sep=''),
                  add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(response)
}
