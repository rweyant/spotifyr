
#' Set credentials to be accessed by all functions
#'
#' @param client_id the client ID given from Spotify
#' @param client_secret the client secret ID given from Spotify
set_credentials <- function(client_id,client_secret){
  assign('client_id', client_id,envir=.GlobalEnv)
  assign('client_secret',client_secret,envir=.GlobalEnv)
}


#' Get tokens for Client Credential
#' This function looks for client_id and client_secret in the global environment
get_tokens <- function(){
  # This works for the moment, but would like to use httr
  response <-
    system(
      paste(curl_cmd, ' -H "Authorization: Basic ',
            base64(paste(client_id,':',client_secret,sep='')),
            '" -d grant_type=client_credentials https://accounts.spotify.com/api/token',
            sep=''),
      intern=TRUE)

  parsed_response <- str_split(response[length(response)],'\\{')[[1]]

  end_response <- paste('{',parsed_response[length(parsed_response)],sep='')

  fromJSON(end_response)
}


#' Get user code for Authorization Code user code
#' Lauches Selenium Webbrowser to handle process
#' This function looks for client_id and client_secret in the global environment
#'
get_user_code <- function(){

  response <- GET(url=authorize_url,
                  query=list(client_id=client_id,
                             response_type='code',
                             scope=all_scopes,
                             redirect_uri='http://www.bertplot.com/visualization/'))

  unlink(system.file("bin", package = "RSelenium"), recursive = T)
  checkForServer()
  startServer(log = FALSE, invisible = FALSE)

  webd <- remoteDriver()
  Sys.sleep(3)
  # webd <- remoteDriver(remoteServerAddr = "localhost",browserName='chrome',port=4455)
  x <- webd$open()
  x <- webd$navigate(response$url)

  ## Need to wait for next page
  ## Probably a better way to do this.
  while(str_detect(webd$getCurrentUrl()[[1]],'accounts.spotify.com')) Sys.sleep(2)

  user_code <- str_split(webd$getCurrentUrl()[[1]],pattern='code=')[[1]][2]

  # Close everything down
  webd$closeWindow()
  webd$closeServer()

  user_code
}

#' Using the user_code, generates tokens for user code
#'
#' @param user_code user_code from get_user_code() function
get_user_token <- function(user_code){

  # This works for the moment, but would like to use httr
  response <-
    system(
      paste(curl_cmd,' -H "Authorization: Basic ',
            base64(paste(client_id,':',client_secret,sep='')),
            '" -d grant_type=authorization_code -d code=',user_code,
            ' -d redirect_uri=http://www.bertplot.com/visualization/ https://accounts.spotify.com/api/token',
            sep=''),
      intern=TRUE)

  parsed_response <- str_split(response[length(response)],'\\{')[[1]]
  end_response <- paste('{',parsed_response[length(parsed_response)],sep='')


  # Make accessible globally
  assign('access_token',fromJSON(end_response)$access_token,envir = .GlobalEnv)
  assign('refresh_token',fromJSON(end_response)$refresh_token,envir = .GlobalEnv)

  # Return Object
  fromJSON(end_response)
}

#' Refresh your tokens
#'
#' @param token default = NULL.  If no token is given, it will look for refresh_token in global environment
refresh_user_token <- function(token=NULL){

  if(is.null(token) && !exists('refresh_token')) stop("Need to provide refresh token")
  if(is.null(token) && exists('refresh_token')) token <- refresh_token

  response <-
    system(
      paste(curl_cmd, ' -H "Authorization: Basic ',
            base64(paste(client_id,':',client_secret,sep='')),
            '" -d grant_type=refresh_token -d refresh_token=',token,
            ' https://accounts.spotify.com/api/token',
            sep=''),
      intern=TRUE)


  parsed_response <- str_split(response[length(response)],'\\{')[[1]]
  end_response <- paste('{',parsed_response[length(parsed_response)],sep='')

  # Make accessible globally
  assign('access_token',fromJSON(end_response)$access_token,envir = .GlobalEnv)
  # assign('refresh_token',fromJSON(response)$refresh_token,envir = .GlobalEnv)

  # Return Object
  fromJSON(end_response)

}
