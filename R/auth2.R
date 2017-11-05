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
