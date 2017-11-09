#' Get a List of Featured Playlists
#' Get a list of Spotify featured playlists (shown, for example, on a Spotify player’s “Browse” tab).
#'
#' @references \href{https://developer.spotify.com/web-api/get-list-featured-playlists/}{API documentation}
#'
#' @export
#'
#' @examples
#' set_tokens()
#' get_featured_playlists()
get_featured_playlists <- function(...){
  response <- GET(url = BROWSE_FEATURED_PLAYLISTS_URL,
                  add_headers(Authorization = glue('Bearer {access_token}')),
                  query = list(...))
  get_response_content(response)
}


#' Get a List of New Releases
#' Get a list of new album releases featured in Spotify (shown, for example, on a Spotify player’s “Browse” tab).
#' @references \href{https://developer.spotify.com/web-api/get-list-new-releases/}{API documentation}
#'
#' @param country Required if you want any results.
#' A country: an ISO 3166-1 alpha-2 country code.
#' Provide this parameter if you want the list of
#' returned items to be relevant to a particular country.
#'
#' @export
#'
#' @examples
#' get_new_releases(country = 'US')
get_new_releases <- function(country,...){
  response <- GET(url = BROWSE_NEW_RELEASES_URL,
                  add_headers(Authorization = glue('Bearer {access_token}')),
                  query = list(country=country,...))
  get_response_content(response)
}

#' Get a List of Categories
#' Get a list of categories used to tag items in Spotify (on, for example, the Spotify player’s “Browse” tab).
#'
#' @references \href{https://developer.spotify.com/web-api/get-list-categories/}{API documentation}
#'
#' @export
#'
#' @examples
#' get_categories()
get_categories <- function(...){
  response <- GET(url = BROWSE_CATEGORIES_URL,
                  add_headers(Authorization = glue('Bearer {access_token}')),
                  query = list(...))
  get_response_content(response)
}


#' Get a Category
#' Get a single category used to tag items in Spotify (on, for example, the Spotify player’s “Browse” tab).
#'
#' @references \href{https://developer.spotify.com/web-api/get-category/}{API documentation}
#'
#' @param category_id The Spotify category ID for the category.
#'
#' @export
#'
#' @examples
#' get_category('party')
get_category <- function(category_id,...){
  response <- GET(url = glue('{BROWSE_CATEGORIES_URL}/{category_id}'),
                query = list(...),
                add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(response)
}

#' Get a Category’s Playlists
#' Get a list of Spotify playlists tagged with a particular category.
#'
#' @references \href{https://developer.spotify.com/web-api/get-categorys-playlists/}{API documentation}
#'
#' @param category_id The Spotify category ID for the category.
#'
#' @export
#'
#' @examples
#' get_category_playlists('party')
get_category_playlists <- function(category_id,...){
  response <- GET(url = glue('{BROWSE_CATEGORIES_URL}/{category_id}/playlists'),
                  query = list(...),
                  add_headers(Authorization=paste('Bearer',access_token)))
  get_response_content(response)
}

