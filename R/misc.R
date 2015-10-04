
base_url <- 'https://api.spotify.com'

authorize_url <- 'https://accounts.spotify.com/authorize/'
search_url <- paste(base_url,'/v1/search',sep='')
# album_url <- paste(base_url,'/v1/albums',sep='')
albums_url <- paste(base_url,'/v1/albums/',sep='')
artists_url <- paste(base_url,'/v1/artists/',sep='')
browse_featured_playlists_url<- paste(base_url,'/v1/browse/featured-playlists/',sep='')
browse_new_releases_url<- paste(base_url,'/v1/browse/new-releases/',sep='')
browse_categories_url <- paste(base_url,'/v1/browse/categories/',sep='')
following_url <- 'https://api.spotify.com/v1/me/following'
library_url <- 'https://api.spotify.com/v1/me/tracks'
user_url <- 'https://api.spotify.com/v1/users'



all_scopes <- paste('playlist-read-private playlist-read-collaborative playlist-modify-public playlist-modify-private',
                    'streaming user-follow-modify user-follow-read user-library-modify user-library-read user-read-private',
                    'user-read-birthdate user-read-email')


#' Check API call executed correctly
get_response_content <- function(response){
  if(status_code(response) == 400) stop('The request had bad syntax or was inherently impossible to be satisfied.')
  if(status_code(response) == 401) stop('Authentication failed, probably because of a bad API key.')
  if(status_code(response) == 402) stop('A limit was reached, either you exceeded per hour requests limits or your balance is insufficient.')
  if(status_code(response) == 403) stop('You are not authorized to perform this operation or the api version you\'re trying to use has been shut down.')
  if(status_code(response) == 404) stop('Requested resource was not found.')
  if(status_code(response) == 405) stop('Requested method was not found.')
  if(status_code(response) == 429) stop('Too Many Requests -- Rate limiting has been applied.')
  if(status_code(response) == 500) stop('Internal Server Error. You should never receive this error because our clever coders catch them all ... but if you are unlucky enough to get one, please report it to us through a comment at the bottom of this page.')
  if(status_code(response) == 502) stop('Bad Gateway - The server was acting as a gateway or proxy and received an invalid response from the upstream server.')
  if(status_code(response) == 503) stop('Service Unavailable - The server is currently unable to handle the request due to a temporary condition which will be alleviated after some delay. You can choose to resend the request again.')
  if(!(status_code(response) %in% c(200,201,204))) stop("Unknown Status Code.")

  # Otherwise, return content
  content(response)
}



