
base_url <- 'https://api.spotify.com'

authorize_url <- 'https://accounts.spotify.com/authorize/'
search_url <- paste(base_url,'/v1/search',sep='')
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


curl_cmd <- 'curl '
if(Sys.info()['sysname'] == 'Windows') curl_cmd <- 'curl -k '

#' Check API call executed correctly
get_response_content <- function(response){
  if(!(status_code(response) %in% c(200,201,204))) stop(paste('\nError Code: ', content(response)$error$status,'\n',content(response)$error$message))
  # Otherwise, return content
  content(response)
}


####

extract_artist <- function(artist) {
  artist$genre <- paste(artist$genres,collapse='|')
  artist[c('name','id','genre','popularity','followers','href','type','uri')] %>% unlist
}
extract_album <- function(album) {
  album$artist <- paste(sapply(album$artists,function(x) x$name),collapse='|')
  album$genre <- paste(album$genres,collapse='|')
  album$ntracks <- length(album$tracks$items)
  album[c('name','id','uri','artist','genre','ntracks','release_date','popularity','href','type')] %>% unlist
}
extract_song <- function(song){
  song_item <- song$track
  song_item$artist <- paste(sapply(song$artists,function(x) x$name),collapse='|')
  song_item$album_name <- song_item$album$name
  song_item$album_id <- song_item$album$id
  song_item[c('name','id','uri','duration_ms','artist','album_name','album_id','popularity','href','track_number','type')]  %>% unlist
}
extract_category <- function(category)  category[c('name','id','href')] %>% unlist

extract_playlist <- function(playlist){
  playlist[c()]
}

simplify_result <- function(result,type='artists'){
  if(type=='artists') x <- sapply(result[[type]],extract_artist)
  if(type=='albums') x <- sapply(result[[type]],extract_album)
  if(type=='songs' && 'items' %in% names(result)) x <- sapply(result[['items']],extract_song)
  if((type=='categories')) x <- sapply(result[[type]][['items']],extract_category)
  as.data.frame(t(x))
}
