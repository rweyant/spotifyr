
#' Set credentials to be accessed by all functions
#'
#' @export
#'
#' @param client_id the client ID given from Spotify
#' @param client_secret the client secret ID given from Spotify
set_credentials <- function(client_id, client_secret){
  # TODO: change to environment variables
  Sys.setenv('SPOTIFY_CLIENT' = client_id)
  Sys.setenv('SPOTIFY_SECRET' = client_secret)
  # assign('client_redirect_uri', client_redirect_uri, envir=.GlobalEnv)
}


#' Get tokens for Client Credential
#' This function looks for client_id and client_secret in the global environment
#'
#' @export
#' @examples
#' get_tokens()
get_tokens <- function(){
  response <- POST(url = TOKENS_URL,
                   accept_json(),
                   authenticate(Sys.getenv('SPOTIFY_CLIENT'), Sys.getenv('SPOTIFY_SECRET')),
                   body = list(grant_type='client_credentials'),
                   encode = 'form')

  get_response_content(response)
}

#' Set tokens in global environment
#'
#' @export
#'
#' @examples
#' set_tokens()
set_tokens <- function() {
  tokens <- get_tokens()
  assign('access_token', tokens$access_token, envir = .GlobalEnv)
}

#' Authorize a user
#'
#' @param cache whether to cache the results
#'
#' @export
#'
#' @examples
#' set_tokens()
#' user_auth()
user_auth <- function(cache = TRUE) {

  set_tokens()

  # set dropbox oauth2 endpoints
  spotify <- httr::oauth_endpoint(
    authorize = AUTHORIZE_URL,
    access = TOKENS_URL
  )

  # registered dropbox app's key & secret
  spotify_app <- httr::oauth_app("spotifyr",
                                 Sys.getenv('SPOTIFY_CLIENT'),
                                 Sys.getenv('SPOTIFY_SECRET'))

  # get the token
  spotify_token <- httr::oauth2.0_token(
    endpoint = spotify,
    app = spotify_app,
    scope = ALL_SCOPES,
    cache = cache)
  spotify_token
  assign('user_token', spotify_token, envir = .GlobalEnv)
}


