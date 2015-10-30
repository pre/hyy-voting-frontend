'use strict'

angular.module 'hyyVotingFrontendApp'
  .factory 'elections', ($window) ->
    _all = ->
      JSON.parse $window.sessionStorage.getItem('elections')

    _getElection = (electionId) ->
      _.find _all(), 'id', parseInt(electionId)

    save: (elections) ->
      console.log "got elections", elections
      $window.sessionStorage.setItem 'elections', JSON.stringify elections

    get: ->
      new Promise (resolve, reject) ->
        elections = $window.sessionStorage.getItem('elections')

        if elections
          resolve JSON.parse elections
        else
          reject "No elections available"

    getCandidatesUrl: (electionId) ->
      _getElection(electionId).candidates.url

    getAlliancesUrl: (electionId) ->
      _getElection(electionId).alliances.url
