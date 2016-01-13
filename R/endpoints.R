
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

