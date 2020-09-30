'use strict'

angular.module 'hyyVotingFrontendApp'
  .service 'VoteSrv', (SessionRestangular) ->

    @submit = (electionId, candidateId) ->
      SessionRestangular
        .one('elections', electionId)
        .all('vote')
        .post(candidate_id: candidateId)

    @getVotingRight = (electionId) ->
      SessionRestangular
        .one("elections", electionId)
        .one('voting_right')
        .get()

    return
