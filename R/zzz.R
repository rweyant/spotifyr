.onLoad <- function(libname, pkgname){

  if(Sys.getenv('SPOTIFY_CLIENT') == '')
    warning('No Spotify client id found.  You need to set credentials as SPOTIFY_CLIENT environment variables in your ~/.Renviron file ')

  if(Sys.getenv('SPOTIFY_SECRET') == '')
    warning('No Spotify client id found.  You need to set credentials as SPOTIFY_SECRET environment variable in your ~/.Renviron file ')

}
