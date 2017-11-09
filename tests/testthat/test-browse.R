context("Browse endpoints")

test_that("browse functions return expected content", {

  # setup
  set_tokens()

  response <- get_featured_playlists()
  expect_is(typeof(response), 'character')

  response <- get_new_releases(country = 'US')
  expect_is(typeof(response), 'character')

  response <- get_categories()
  expect_is(typeof(response), 'character')

  response <- get_category('party')
  expect_is(typeof(response), 'character')

  response <- get_category_playlists('party')
  expect_is(typeof(response), 'character')

})

