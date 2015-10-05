
set_credentials <- function(client_id,client_secret){
  assign('client_id', client_id,envir=.GlobalEnv)
  assign('client_secret',client_secret,envir=.GlobalEnv)

}

get_tokens <- function(){
  # This works for the moment, but would like to use httr
  response <-
    system(
      paste('curl -H "Authorization: Basic ',
            base64(paste(client_id,':',client_secret,sep='')),
            '" -d grant_type=client_credentials https://accounts.spotify.com/api/token',
            sep=''),
      intern=TRUE)
  fromJSON(response)
}

## Does not work yet -- need to figure out browser redirect auth method
get_user_code <- function(){
  library(RSelenium)
  response <- GET(url=authorize_url,
                  query=list(client_id=client_id,
                             response_type='code',
                             scope=all_scopes,
                             redirect_uri='http://www.bertplot.com/visualization/'))

  unlink(system.file("bin", package = "RSelenium"), recursive = T)
  checkForServer()
  startServer()

  webd <- remoteDriver()
  x <- webd$open()
  x <- webd$navigate(response$url)

  ## Need to wait for next page
  ## Probably a better way to do this.
  while(str_detect(webd$getCurrentUrl()[[1]],'accounts.spotify.com')) Sys.sleep(3)

  user_code <- str_split(webd$getCurrentUrl()[[1]],pattern='code=')[[1]][2]

  # Close everything down
  webd$closeWindow()
  webd$closeServer()

  user_code
}

get_user_token <- function(user_code){

  # This works for the moment, but would like to use httr
  response <-
    system(
      paste('curl -H "Authorization: Basic ',
            base64(paste(client_id,':',client_secret,sep='')),
            '" -d grant_type=authorization_code -d code=',user_code,
            ' -d redirect_uri=http://www.bertplot.com/visualization/ https://accounts.spotify.com/api/token',
            sep=''),
      intern=TRUE)

  # Make accessible globally
  assign('access_token',fromJSON(response)$access_token,envir = .GlobalEnv)

  # Return Object
  fromJSON(response)
}

#' Refresh your token
refresh_user_token <- function(token=NULL){

  if(is.null(token) && !exists('refresh_token')) stop("Need to provide refresh token")
  if(is.null(token) && exists('refresh_token')) token <- refresh_token

  response <-
    system(
      paste('curl -H "Authorization: Basic ',
            base64(paste(client_id,':',client_secret,sep='')),
            '" -d grant_type=refresh_token -d code=',user_code,
            ' -d refresh_token=',token,
            ' https://accounts.spotify.com/api/token',
            sep=''),
      intern=TRUE)

  # Make accessible globally
  assign('access_token',fromJSON(response)$access_token,envir = .GlobalEnv)
  assign('refresh_token',fromJSON(response)$refresh_token,envir = .GlobalEnv)

  # Return Object
  fromJSON(response)

}
