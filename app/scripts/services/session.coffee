'use strict'

angular.module 'hyyVotingFrontendApp'
  .service 'SessionSrv', ($window, Restangular, elections) ->

    @requestLink = (email) ->
      Restangular
        .all('sessions')
        .all('link')
        .post(email: email)

    @signIn = (token) ->
      Restangular.all('sessions').post(token: token).then(
        (data) => @save data
      )

    @getJwt = ->
      $window.sessionStorage.getItem 'jwt'

    @getUser = ->
      try
        JSON.parse $window.sessionStorage.getItem 'user'
      catch e
        console.log "Could not get current user", e
        {}

    @getVoter = ->
      try
        JSON.parse $window.sessionStorage.getItem 'voter'

      catch e
        console.error "Could not get current voter", e
        null

    @save = (data) ->
      new Promise (resolve, reject) ->
        $window.sessionStorage.setItem 'jwt', data.jwt
        $window.sessionStorage.setItem 'user', JSON.stringify data.user
        $window.sessionStorage.setItem 'voter', JSON.stringify data.voter

        if data.elections
          elections.save data.elections
          type = "elections"
        else
          type = "eligibility"

        resolve({type: type})

    return
