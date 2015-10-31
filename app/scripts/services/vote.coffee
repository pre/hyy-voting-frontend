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
      SessionRestangular
        .one('elections', electionId)
        .one('candidates', candidateId)
        .all('vote')
        .post()

    @all = ->
      SessionRestangular
        .all("votes")
        .getList()

    @get = (electionId) ->
      SessionRestangular
        .one("elections", electionId)
        .one('vote')
        .get()

    return
