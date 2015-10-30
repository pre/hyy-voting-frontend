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

    @submit = (electionId, candidateId) ->
      console.log "[election: #{electionId}] You voted id: #{candidateId}"
      SessionRestangular
        .one('elections', electionId)
        .one('candidates', candidateId)
        .all('vote')
        .post()

    return
