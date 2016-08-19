'use strict'

angular.module 'hyyVotingFrontendApp'
  .service 'VoteSrv', (SessionRestangular) ->

    @submit = (electionId, candidateId) ->
      SessionRestangular
        .one('elections', electionId)
        .all('vote')
        .post(candidate_id: candidateId)

    #TODO:halloped Find out elections where user has already voted
    @all = ->
      new Promise (resolve, reject) ->
        resolve {}
      # SessionRestangular
      #   .all("votes")
      #   .getList()

    @getVotingRight = (electionId) ->
      SessionRestangular
        .one("elections", electionId)
        .one('voting_right')
        .get()

    #TODO:halloped Display who user has voted previously (vote can be changed)
    @getPreviousVote = (electionId) ->
      new Promise (resolve, reject) ->
        resolve {}
      # SessionRestangular
      #   .one("elections", electionId)
      #   .one('vote')
      #   .get()

    return
