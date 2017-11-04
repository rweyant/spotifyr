context("Artists endpoints")

test_that("get_artist=* functions return expected content", {

  expected_artist_fields <- c('external_urls', 'followers', 'genres', 'href',
                              'id', 'images', 'name', 'popularity', 'type',
                              'uri')
  # setup
  set_tokens()

  response <- get_artist('42ZTPxJukaCRQuMjmxVJo4')
  expect_is(typeof(response), 'character')
  expect_true(all(expected_artist_fields %in% names(response)))
  expect_error(get_artist('1232356563'))

  response <- get_artists(ids = c('0oSGxfWSnnOXhD2fKuz2Gy','3dBVyJ7JuOMt4GE9607Qin'))
  expect_is(typeof(response), 'character')
  expect_true('artists' %in% names(response))
  expect_equal(length(response$artists), 2)
  expect_true(all(expected_artist_fields %in% names(response$artists[[1]])))
  expect_error(get_artists(c('1232 356563',' 2313123')))

  response <- get_artist_albums('1vCWHaC5f2uS3yhpwWbIA6')
  expect_is(typeof(response), 'character')

  response <- get_artist_toptracks('1vCWHaC5f2uS3yhpwWbIA6')
  expect_is(typeof(response), 'character')

  response <- get_artist_relatedartists('1vCWHaC5f2uS3yhpwWbIA6')
  expect_is(typeof(response), 'character')

})

