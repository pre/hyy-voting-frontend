'use strict'

###*
 # @ngdoc service
 # @name hyyVotingFrontendApp.Session
 # @description
 # # Session
 # Service in the hyyVotingFrontendApp.
###
angular.module 'hyyVotingFrontendApp'
  .service 'SessionSrv', ($window, Restangular, elections) ->

    @requestLink = (email) ->
      Restangular.all('tokens').post(email: email)

    @signIn = (token) ->
      Restangular.all('sessions').post(token: token).then(
        (data) => @save data
      )

    @getJwt = ->
      $window.sessionStorage.getItem 'jwt'

    @save = (data) ->
      new Promise (resolve, reject) ->
        elections.save data.elections
        $window.sessionStorage.setItem 'jwt', data.jwt

        resolve()

    return
