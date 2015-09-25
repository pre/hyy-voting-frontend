'use strict'

###*
 # @ngdoc service
 # @name hyyVotingFrontendApp.vote
 # @description
 # # vote
 # Service in the hyyVotingFrontendApp.
###
angular.module 'hyyVotingFrontendApp'
  .service 'VoteSrv', (Restangular) ->

    @submit = (candidateId) ->
      console.log "You voted #{candidateId}"
      Restangular.all('votes').post(candidate: { id: candidateId } )

    return
