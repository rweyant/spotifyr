
BASE_URL <- 'https://api.spotify.com'
AUTHORIZE_URL <- 'https://accounts.spotify.com/authorize'
TOKENS_URL <- 'https://accounts.spotify.com/api/token'

SEARCH_URL <- glue('{BASE_URL}/v1/search')
ALBUMS_URL <- glue('{BASE_URL}/v1/albums')
ARTIST_URL <- glue('{BASE_URL}/v1/artists')
USER_URL <- glue('{BASE_URL}/v1/users')

BROWSE_FEATURED_PLAYLISTS_URL <- paste(BASE_URL,'/v1/browse/featured-playlists',sep='')
BROWSE_NEW_RELEASES_URL<- paste(BASE_URL,'/v1/browse/new-releases',sep='')
BROWSE_CATEGORIES_URL <- paste(BASE_URL,'/v1/browse/categories',sep='')

FOLLOWING_URL <- 'https://api.spotify.com/v1/me/following'
LIBRARY_URL <- 'https://api.spotify.com/v1/me/tracks'
USER_URL <- 'https://api.spotify.com/v1/users'

ALL_SCOPES <- paste('playlist-read-private playlist-read-collaborative playlist-modify-public playlist-modify-private',
                    'streaming user-follow-modify user-follow-read user-library-modify user-library-read user-read-private',
                    'user-read-birthdate user-read-email')

