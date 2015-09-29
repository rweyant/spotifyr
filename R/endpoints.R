
base_url <- 'https://api.spotify.com'

search_url <- paste(base_url,'/v1/search',sep='')
album_url <- paste(base_url,'/v1/albums',sep='')
albums_url <- paste(base_url,'/v1/albums/',sep='')


#' Check API call executed correctly
check_status_code <- function(code){
  if(code == 400) stop('The request had bad syntax or was inherently impossible to be satisfied.')
  if(code == 401) stop('Authentication failed, probably because of a bad API key.')
  if(code == 402) stop('A limit was reached, either you exceeded per hour requests limits or your balance is insufficient.')
  if(code == 403) stop('You are not authorized to perform this operation or the api version you\'re trying to use has been shut down.')
  if(code == 404) stop('Requested resource was not found.')
  if(code == 405) stop('Requested method was not found.')
  if(code != 200) stop("Unknown Status Code.")
}
