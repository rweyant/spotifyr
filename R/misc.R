
base_url <- 'https://api.spotify.com'

search_url <- paste(base_url,'/v1/search',sep='')
# album_url <- paste(base_url,'/v1/albums',sep='')
albums_url <- paste(base_url,'/v1/albums/',sep='')
artists_url <- paste(base_url,'/v1/artists/',sep='')


#' Check API call executed correctly
check_status_code <- function(code){
  if(code == 400) stop('The request had bad syntax or was inherently impossible to be satisfied.')
  if(code == 401) stop('Authentication failed, probably because of a bad API key.')
  if(code == 402) stop('A limit was reached, either you exceeded per hour requests limits or your balance is insufficient.')
  if(code == 403) stop('You are not authorized to perform this operation or the api version you\'re trying to use has been shut down.')
  if(code == 404) stop('Requested resource was not found.')
  if(code == 405) stop('Requested method was not found.')
  if(code == 429) stop('Too Many Requests -- Rate limiting has been applied.')
  if(code == 500) stop('Internal Server Error. You should never receive this error because our clever coders catch them all ... but if you are unlucky enough to get one, please report it to us through a comment at the bottom of this page.')
  if(code == 502) stop('Bad Gateway - The server was acting as a gateway or proxy and received an invalid response from the upstream server.')
  if(code == 503) stop('Service Unavailable - The server is currently unable to handle the request due to a temporary condition which will be alleviated after some delay. You can choose to resend the request again.')
  if(!(code %in% c(200,201,204))) stop("Unknown Status Code.")
}
