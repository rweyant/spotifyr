#' Get a User’s Profile
#' Get public profile information about a Spotify user
#'
#' @references \href{https://developer.spotify.com/web-api/get-users-profile/}{API documentation}
#'
#' @param user_id
#'
#' @export
#'
#' @examples
#' set_tokens()
#' get_user_profile(user_id = 'rweyant')
get_user_profile <- function(user_id){
  response <- GET(url = glue('{USER_URL}/{user_id}'),
                  add_headers(Authorization = glue('Bearer {access_token}')))
  get_response_content(response)
}


#' Get Current User’s Profile
#' Get detailed profile information about the current user (including the current user’s username).
#' @references \href{https://developer.spotify.com/web-api/get-current-users-profile/}{API documentation}
#'
#' @export
#'
#' @examples
#' set_tokens()
#' user_auth()
#' get_current_user_profile()
get_current_user_profile <- function(){
  response <- GET(url = glue('{BASE_URL}/v1/me/'),
                  config(token = user_token))
  get_response_content(response)
}
