% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/player.R
\name{start_user_playback}
\alias{start_user_playback}
\title{Start/Resume a User’s Playback
Start a new context or resume current playback on the user’s active device.}
\usage{
start_user_playback(device_id = NULL, play = TRUE)
}
\description{
Start/Resume a User’s Playback
Start a new context or resume current playback on the user’s active device.
}
\examples{
set_tokens()
user_auth()
start_user_playback()
}
\references{
\href{https://developer.spotify.com/web-api/start-a-users-playback/}{API documentation}
}
