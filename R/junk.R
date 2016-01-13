
###########################################
# Old functions not ready to part with    #
###########################################

extract_category <- function(category)  category[c('name','id','href')] %>% unlist

extract_playlist <- function(playlist){
  playlist[c()]
}



old_extract_song <- function(song){
  if('track' %in% names(song)) song_item <- song$track
  if('artists' %in% names(song)) song_item <- song
  song_item$artist <- paste(sapply(song_item$artists,function(x) x$name),collapse='|')
  song_item$album_name <- song_item$album$name
  song_item$album_id <- song_item$album$id
  song_item[c('name','id','uri','duration_ms','artist','album_name','album_id','popularity','href','track_number','type')]  %>% unlist
}
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



# May be obsolete
curl_cmd <- 'curl '
if(Sys.info()['sysname'] == 'Windows') curl_cmd <- 'curl -k '
