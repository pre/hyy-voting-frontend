'use strict'

###*
 # @ngdoc service
 # @name hyyVotingFrontendApp.Session
 # @description
 # # Session
 # Service in the hyyVotingFrontendApp.
###
angular.module 'hyyVotingFrontendApp'
  .service 'SessionSrv', ($window) ->

    @requestLink = ->
      Promise.resolve message: "lol"

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
        $window.sessionStorage.setItem 'goodToken', data.goodToken
        $window.sessionStorage.setItem 'alliancesUrl', data.alliances.url
        $window.sessionStorage.setItem 'candidatesUrl', data.candidates.url

        resolve()

    return
