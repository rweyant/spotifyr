
auth_test <- function(){
  cat('Testing get_tokens()\n')
  web_client_tokens <- get_tokens()

  cat('Testing get_user_code()\n')
  user_code <- get_user_code()

  cat('Testing get_user_token()\n')
  user_tokens <- get_user_token(user_code)
  # cat(access_token,'\n')

  cat('Testing refresh_user_token()\n')
  user_tokens2 <- refresh_user_token()
  # cat(access_token,'\n')

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

library_test <- function(){

  cat('Testing get_saved_tracks()\n')
  saved_tracks <- get_saved_tracks()
  test_id <- saved_tracks$items[[1]]$track$id
  test_name <- saved_tracks$items[[1]]$track$name

  cat(test_name,' in library? ', check_saved_tracks(test_id),'\n',sep='')

  cat('Testing remove_track()\n')
  remove_track(test_id)

  cat(test_name,' in library? ', check_saved_tracks(test_id),'\n',sep='')

  cat('Testing save_track()\n')
  save_track(test_id)

  cat(test_name,' in library? ', check_saved_tracks(test_id),'\n',sep='')

}

albums_test <- function(){
  artists <- search('slayer',type='artist',limit=1)

  test_artist_id <- artists$artists$items[[1]]$id
  album_ids <- get_artist_albums(test_artist_id)

  test_album_id1 <- album_ids$items[[1]]$id
  test_album_id2 <- album_ids$items[[2]]$id

  cat('Testing get_album()\n')
  get_album(test_album_id1)

  cat('Testing get_albums()\n')
  get_albums(ids=c(test_album_id1,test_album_id2))

  cat('Testing get_album_tracks()\n')
  get_album_tracks(test_album_id1)

}

browse_test <- function(){
  cat('Testing get_featured_playlists()\n')
  featured_playlists <- get_featured_playlists()

  cat('Testing get_new_releases()\n')
  new_releases <- get_new_releases('us')

  cat('Testing get_categories()\n')
  categories <- get_categories(limit=50)

  cat('Testing get_category()\n')
  category <- get_category(categories$categories$items[[18]]$id)

  cat('Testing get_category_playlists()\n')
  playlists <- get_category_playlists(categories$categories$items[[18]]$id,limit=50)

}

follow_test <- function(){

  cat('Testing get_user_followed_artists()\n')
  followed_artists <- get_user_followed_artists()

  cat('Following kraigrs? ', following('kraigrs',type='user'),'\n')
  cat('Testing user follow()\n')
  follow('kraigrs',type='user')
  cat('Following kraigrs? ', following('kraigrs',type='user'),'\n')

  cat('Testing user unfollow()\n')
  unfollow('kraigrs',type='user')
  cat('Following kraigrs? ', following('kraigrs',type='user'),'\n')


  test_artist_id <- artists$artists$items[[1]]$id
  cat('Following Slayer? ', following(test_artist_id,type='artist'),'\n')
  cat('Testing artist follow()\n')
  follow(test_artist_id,type='artist')
  cat('Following Slayer? ', following(test_artist_id,type='artist'),'\n')

  cat('Testing artist unfollow()\n')
  unfollow(test_artist_id,type='artist')
  cat('Following Slayer? ', following(test_artist_id,type='artist'),'\n')


  ## Get Categories/playlists
  category <- get_category(categories$categories$items[[18]]$id)
  playlists <- get_category_playlists(categories$categories$items[[18]]$id,limit=50)
  test_owner_id <- playlists$playlists$items[[1]]$owner$id
  test_playlist_id <- playlists$playlists$items[[1]]$id
  ###

  cat('rweyant and kraigrs follow playlist?',following_playlist(owner_id = test_owner_id,playlist_id = test_playlist_id,ids=c('rweyant','kraigrs')),'\n')

  cat('Testing follow_playlist()\n')
  follow_playlist(owner_id = test_owner_id,playlist_id = test_playlist_id)
  cat('rweyant and kraigrs follow playlist?',following_playlist(owner_id = test_owner_id,playlist_id = test_playlist_id,ids=c('rweyant','kraigrs')),'\n')

  cat('Testing unfollow_playlist()\n')
  unfollow_playlist(owner_id = test_owner_id,playlist_id = test_playlist_id)
  cat('rweyant and kraigrs follow playlist?',following_playlist(owner_id = test_owner_id,playlist_id = test_playlist_id,ids=c('rweyant','kraigrs')),'\n')

}


profiles_test <- function(){

  cat('Testing get_user_profile()\n')
  test_profile <- get_user_profile('kraigrs')

  cat('Testing get_current_user_profile()\n')
  test_current_profile <- get_current_user_profile()

}

search_test <- function(){

  cat('Testing artist search()\n')
  test_artist_search <- search(q = 'metallica',type='artist')

  cat('Testing album search()\n')
  test_album_search <- search(q = 'master of puppets',type='album')

  cat('Testing track search()\n')
  test_track_search <- search(q = 'master of puppets',type='track')

  cat('Testing playlist search()\n')
  test_playlist_search <- search(q = 'doom metal',type='playlist')

}


playlists_test <- function(){

  cat('Testing get_user_playlists()\n')
  test_user_playlists <- get_user_playlists(user_id = 'rweyant')

  test_playlist_id <- test_user_playlists$items[[1]]$id

  cat('Testing get_playlist()\n')
  test_playlist <- get_playlist(user_id = 'rweyant',playlist_id = test_playlist_id)

  cat('Testing get_playlist_tracks()\n')
  test_playlist_tracks <- get_playlist_tracks(user_id = 'rweyant',playlist_id = test_playlist_id)

  cat('Testing create_playlist()\n')
  test_create_playlist <- create_playlist(user_id = 'rweyant',name = 'test_playlist')

  check_playlist_creation <- get_user_playlists(user_id = 'rweyant')
  cat('Playlist successfully created? ', check_playlist_creation$items[[1]]$name == 'test_playlist')

  cat('Testing add_tracks_to_playlist()\n')
  test_track_search <- search(q = 'master of puppets',type='track')
  test_add_tracks_to_playlist <- add_tracks_to_playlist(user_id = 'rweyant',
                                                        playlist_id = test_create_playlist$id,
                                                        uris = test_track_search$tracks$items[[1]]$uri)
  check_song_addition <- get_playlist_tracks(user_id = 'rweyant',playlist_id = test_create_playlist$id)
  cat('Song successfully added? ', check_song_addition$items[[1]]$track$uri == test_track_search$tracks$items[[1]]$uri)

}
