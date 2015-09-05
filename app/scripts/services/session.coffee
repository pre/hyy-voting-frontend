'use strict'

###*
 # @ngdoc service
 # @name hyyVotingFrontendApp.Session
 # @description
 # # Session
 # Service in the hyyVotingFrontendApp.
###
angular.module 'hyyVotingFrontendApp'
  .service 'SessionSrv', (Restangular) ->

    @requestLink = ->
      Promise.resolve message: "lol"

    return
