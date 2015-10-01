#' Get a List of Featured Playlists
#' Get a list of Spotify featured playlists (shown, for example, on a Spotify player’s “Browse” tab).
#'
#' For more information: https://developer.spotify.com/web-api/get-list-featured-playlists/
get_featured_playlists <- function(access_token=NULL,...){
  if(is.null(access_token)) access_token <- get_tokens()$access_token
  search <- GET(url = browse_featured_playlists_url,
                query=list(...),
                add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(search)
}


#' Get a List of New Releases
#' Get a list of new album releases featured in Spotify (shown, for example, on a Spotify player’s “Browse” tab).
#' @param country Required if you want any results.
#' A country: an ISO 3166-1 alpha-2 country code.
#' Provide this parameter if you want the list of
#' returned items to be relevant to a particular country.
#'
#' For more information: https://developer.spotify.com/web-api/get-list-new-releases/
get_new_releases <- function(access_token=NULL,...){
  if(is.null(access_token)) access_token <- get_tokens()$access_token
  search <- GET(url = browse_new_releases_url,
                query=list(...),
                add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(search)
}

#' Get a List of Categories
#' Get a list of categories used to tag items in Spotify (on, for example, the Spotify player’s “Browse” tab).
#'
#' For more information: https://developer.spotify.com/web-api/get-list-categories/
get_categories <- function(access_token=NULL,...){
  if(is.null(access_token)) access_token <- get_tokens()$access_token
  search <- GET(url = browse_categories_url,
                query=list(...),
                add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(search)
}


#' Get a Category
#' Get a single category used to tag items in Spotify (on, for example, the Spotify player’s “Browse” tab).
#'
#' For more information: https://developer.spotify.com/web-api/get-category/
get_category <- function(category_id,access_token=NULL,...){
  if(is.null(access_token)) access_token <- get_tokens()$access_token
  search <- GET(url = paste(browse_categories_url,category_id,sep=''),
                query=list(...),
                add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(search)
}

#' Get a Category’s Playlists
#' Get a list of Spotify playlists tagged with a particular category.
#'
#' For more information: https://developer.spotify.com/web-api/get-categorys-playlists/
get_category_playlists <- function(category_id,access_token=NULL,...){
  if(is.null(access_token)) access_token <- get_tokens()$access_token
  search <- GET(url = paste(browse_categories_url,category_id,'/playlists',sep=''),
                query=list(...),
                add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(search)
}

