
BASE_URL <- 'https://api.spotify.com'
AUTHORIZE_URL <- 'https://accounts.spotify.com/authorize'
TOKENS_URL <- 'https://accounts.spotify.com/api/token'
API_VERSION <- 'v1'

SEARCH_URL <- glue('{BASE_URL}/{API_VERSION}/search')
ALBUMS_URL <- glue('{BASE_URL}/{API_VERSION}/albums')
ARTIST_URL <- glue('{BASE_URL}/{API_VERSION}/artists')
USER_URL <- glue('{BASE_URL}/{API_VERSION}/users')
TRACKS_URL <- glue('{BASE_URL}/{API_VERSION}/tracks')
AUDIO_ANALYSIS_URL <- glue('{BASE_URL}/{API_VERSION}/audio-analysis')
AUDIO_FEATURES_URL <- glue('{BASE_URL}/{API_VERSION}/audio-features')

BROWSE_FEATURED_PLAYLISTS_URL <- glue('{BASE_URL}/{API_VERSION}/browse/featured-playlists')
BROWSE_NEW_RELEASES_URL <- glue('{BASE_URL}/{API_VERSION}/browse/new-releases')
BROWSE_CATEGORIES_URL <- glue('{BASE_URL}/{API_VERSION}/browse/categories')

FOLLOWING_URL <- glue('{BASE_URL}/{API_VERSION}/me/following')
LIBRARY_URL <- glue('{BASE_URL}/{API_VERSION}/me/tracks')
TOP_URL <- glue('{BASE_URL}/{API_VERSION}/me/top')
PLAYER_URL <- glue('{BASE_URL}/{API_VERSION}/me/player')

USER_URL <- glue('{BASE_URL}/{API_VERSION}/users')

ALL_SCOPES <- paste('playlist-read-private playlist-read-collaborative playlist-modify-public playlist-modify-private',
                    'streaming user-follow-modify user-follow-read user-library-modify user-library-read user-read-private',
                    'user-read-birthdate user-read-email user-top-read user-read-recently-played user-read-playback-state',
                    'user-read-currently-playing user-modify-playback-state')
