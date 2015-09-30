'use strict'

###*
 # @ngdoc service
 # @name hyyVotingFrontendApp.vote
 # @description
 # # vote
 # Service in the hyyVotingFrontendApp.
###
angular.module 'hyyVotingFrontendApp'
  .service 'VoteSrv', (SessionRestangular) ->

    @submit = (candidateId) ->
      console.log "You voted #{candidateId}"
      SessionRestangular.all('votes').post(candidate: { id: candidateId } )

    return
