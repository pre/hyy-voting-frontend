'use strict'

angular.module 'hyyVotingFrontendApp'
  .factory 'elections', ($window) ->

    save: (elections) ->
      $window.sessionStorage.setItem 'elections', JSON.stringify elections

    get: ->
      new Promise (resolve, reject) ->
        elections = $window.sessionStorage.getItem('elections')

        if elections
          resolve JSON.parse elections
        else
          reject "No elections available"
