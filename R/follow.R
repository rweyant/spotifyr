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
