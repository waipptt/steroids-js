class window.AudioController
  # always put everything inside PhoneGap deviceready
  document.addEventListener "deviceready", ->

    # Make Navigation Bar to appear with a custom title text
    steroids.navigationBar.show { title: "audio" }

  @testPlay: ->
    steroids.audio.play {
      path: "clap.wav"
    }, {
      onSuccess: () -> steroids.logger.log "SUCCESS in playing audio"
      onFailure: () -> steroids.logger.log "FAILURE in testPlay"
    }

  @testPrime: ->
    steroids.audio.prime {
    }, {
      onSuccess: () -> steroids.logger.log "SUCCESS in priming audio for playing"
      onFailure: () -> steroids.logger.log "FAILURE in testPrime"
    }

