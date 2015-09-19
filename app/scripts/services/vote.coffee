'use strict'

###*
 # @ngdoc service
 # @name hyyVotingFrontendApp.vote
 # @description
 # # vote
 # Service in the hyyVotingFrontendApp.
###
angular.module 'hyyVotingFrontendApp'
  .service 'VoteSrv', ->

    @submit = (candidateId) ->
      console.log "You voted #{candidateId}"
      Promise.delay(1000).then(
        ->
          new Promise (resolve, reject) ->
            resolve("great success")

      )

    return
