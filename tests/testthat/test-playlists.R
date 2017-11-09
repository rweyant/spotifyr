context("Playlists endpoints")

test_that("playlist functions return expected content", {

  # setup
  set_tokens()

  response <- get_user_playlists(user_id = 'spotify')
  expect_is(typeof(response), 'character')

  response <- get_playlist(user_id = 'spotify',
                           playlist_id = '59ZbFPES4DQwEjBpWHzrtC')
  expect_is(typeof(response), 'character')

  response <- get_playlist_tracks(user_id = 'spotify',
                                  playlist_id = '59ZbFPES4DQwEjBpWHzrtC')
  expect_is(typeof(response), 'character')

  response <- get_user_playlists(user_id='spotify')
  expect_is(typeof(response), 'character')

})

