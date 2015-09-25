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

    @requestLink = (email) ->
      Restangular.all('tokens').post(email: email)

    @getToken = ->
      console.log "goodToken: ", $window.sessionStorage.getItem 'goodToken'
      $window.sessionStorage.getItem 'goodToken'

    @getCandidatesUrl = ->
      url = $window.sessionStorage.getItem 'candidatesUrl'
      console.debug "candidatesUrl: ", url

      url

    @getAlliancesUrl = ->
      url = $window.sessionStorage.getItem 'alliancesUrl'
      console.debug "alliancesUrl: ", url

      url

    @save = (data) ->
      new Promise (resolve, reject) ->
        $window.sessionStorage.setItem 'goodToken', data.details.goodToken
        $window.sessionStorage.setItem 'alliancesUrl', data.details.alliances.url
        $window.sessionStorage.setItem 'candidatesUrl', data.details.candidates.url
        $window.sessionStorage.setItem 'jwt', data.jwt

        resolve()

    return
