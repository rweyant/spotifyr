context("Search endpoint")

test_that("search functions return expected content", {

  # setup
  set_tokens()

  response <- search_spotify(q = 'heavy metal', type = 'artist')
  expect_is(typeof(response), 'character')

  expect_error(search_spotify(q = 'heavy metal', type = 'abcdefg'))

})

