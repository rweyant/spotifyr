context("Albums endpoints")

test_that("get_album* functions return expected content", {

  expected_album_fields <- c('album_type', 'artists', 'available_markets',
                             'copyrights', 'external_ids', 'external_urls',
                             'genres', 'href', 'id', 'images', 'label', 'name',
                             'popularity', 'release_date',
                             'release_date_precision', 'tracks', 'type', 'uri')
  expected_track_fields <- c('artists', 'available_markets', 'disc_number',
                             'duration_ms', 'explicit', 'external_urls', 'href',
                             'id', 'name', 'preview_url', 'track_number', 'type',
                             'uri')
  # setup
  set_tokens()

  response <- get_album('0sNOF9WDwhWunNAHPD3Baj')
  expect_is(typeof(response), 'character')
  expect_true(all(expected_album_fields %in% names(response)))
  expect_error(get_album('1232356563'))

  response <- get_albums(ids = c('41MnTivkwTO3UUJ8DrqEJJ', '6JWc4iAiJ9FjyK0B59ABb4', '6UXCm6bOO4gFlDQZV5yL37'))
  expect_is(typeof(response), 'character')
  expect_true('albums' %in% names(response))
  expect_equal(length(response$albums), 3)
  expect_true(all(expected_album_fields %in% names(response$albums[[1]])))
  expect_error(get_albums(c('1232356563',' 2313123')))

  response <- get_album_tracks('6akEvsycLGftJxYudPjmqK')
  expect_is(typeof(response), 'character')
  expect_true('items' %in% names(response))
  expect_true(all(expected_track_fields %in% names(response$items[[1]])))

})

