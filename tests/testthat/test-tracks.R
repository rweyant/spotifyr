context("Follow endpoints")

test_that("follow functions return expected content", {

  # setup
  set_tokens()

  response <- get_track(id='3n3Ppam7vgaVa1iaRUc9Lp')
  expect_is(typeof(response), 'character')

  response <- get_tracks(ids=c('3n3Ppam7vgaVa1iaRUc9Lp', '3twNvmDtFQtAd5gMKedhLD'))
  expect_is(typeof(response), 'character')

  response <- get_track_audio_analysis(id='3n3Ppam7vgaVa1iaRUc9Lp')
  expect_is(typeof(response), 'character')

  response <- get_track_audio_features(id='3n3Ppam7vgaVa1iaRUc9Lp')
  expect_is(typeof(response), 'character')

  response <-get_tracks_audio_features(ids=c('3n3Ppam7vgaVa1iaRUc9Lp', '3twNvmDtFQtAd5gMKedhLD'))
  expect_is(typeof(response), 'character')

})

