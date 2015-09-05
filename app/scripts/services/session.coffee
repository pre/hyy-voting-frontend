'use strict'

###*
 # @ngdoc service
 # @name hyyVotingFrontendApp.Session
 # @description
 # # Session
 # Service in the hyyVotingFrontendApp.
###
angular.module 'hyyVotingFrontendApp'
  .service 'SessionSrv', ($window, Restangular) ->

    @requestLink = ->
      Promise.resolve message: "lol"

    @save = (data) ->
      new Promise (resolve, reject) ->
        $window.sessionStorage.setItem('goodToken', data.goodToken)
        $window.sessionStorage.setItem('candidatesUrl', data.candidatesUrl)

        resolve()

    return
