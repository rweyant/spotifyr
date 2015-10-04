
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
  response <- GET(url=authorize_url,
                  query=list(client_id=client_id,
                             response_type='code',
                             scope=all_scopes,
                             # scope='user-read-birthdate user-read-email',
                             redirect_uri='http://www.bertplot.com/visualization/'))
}

get_user_token <- function(user_code){

  #   response <- POST(url='https://accounts.spotify.com/api/token',
  #                   body=list(grant_type='authorization_code',
  #                             code=user_code,
  #                             redirect_uri='http://www.bertplot.com/visualization/'),
  #                   add_headers(Authorization=paste('Basic ', base64(paste(client_id,':',client_secret,sep='')),sep='')))
  # This works for the moment, but would like to use httr
  response <-
    system(
      paste('curl -H "Authorization: Basic ',
            base64(paste(client_id,':',client_secret,sep='')),
            '" -d grant_type=authorization_code -d code=',user_code,
            ' -d redirect_uri=http://www.bertplot.com/visualization/ https://accounts.spotify.com/api/token',
            sep=''),
      intern=TRUE)
  fromJSON(response)
}

refresh_user_token <- function(refresh_token){
  response <-
    system(
      paste('curl -H "Authorization: Basic ',
            base64(paste(client_id,':',client_secret,sep='')),
            '" -d grant_type=refresh_token -d code=',user_code,
            ' -d refresh_token=',refresh_token,
            ' https://accounts.spotify.com/api/token',
            sep=''),
      intern=TRUE)
  fromJSON(response)
}
