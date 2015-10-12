library(spotifyr)


auth_test <- function(){
  cat('Testing get_tokens()\n')
  web_client_tokens <- get_tokens()

  cat('Testing get_user_code()\n')
  user_code <- get_user_code()

  cat('Testing get_user_token()\n')
  user_tokens <- get_user_token(user_code)
  cat(access_token,'\n')

  cat('Testing refresh_user_token()\n')
  user_tokens2 <- refresh_user_token()
  cat(access_token,'\n')

}


artist_test <- function(){
  cat('Testing search()\n')
  artists <- search('slayer',type='artist',limit=2)
  id1 <- artists$artists$items[[1]]$id
  id2 <- artists$artists$items[[2]]$id

  cat('Testing get_artist()\n')
  get_artist(id1)

  cat('Testing get_artists()\n')
  get_artists(ids = c(id1,id2))

  cat('Testing get_artist_albums()\n')
  get_artist_albums(id1)

  cat('Testing get_artist_toptracks()\n')
  get_artist_toptracks(id1,country = 'us')

  cat('Testing get_artist_relatedartists()\n')
  slayer_related <- get_artist_relatedartists(id1)




}
