context("Profile endpoints")

test_that("Profile functions return expected content", {

  # setup
  set_tokens()

  response <- get_user_profile(user_id = 'spotify')
  expect_is(typeof(response), 'character')

  expect_error(get_user_profile(user_id = '46rtcygsdhiahdknoamskd fa'))

})

