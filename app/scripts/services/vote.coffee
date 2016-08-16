'use strict'

angular.module 'hyyVotingFrontendApp'
  .service 'VoteSrv', (SessionRestangular) ->

    @submit = (electionId, candidateId) ->
      SessionRestangular
        .one('elections', electionId)
        .one('candidates', candidateId)
        .all('vote')
        .post()

    @all = ->
      #TODO: API
      new Promise (resolve, reject) ->
        resolve {}

      # SessionRestangular
      #   .all("votes")
      #   .getList()

    @get = (electionId) ->
      #TODO: API
      new Promise (resolve, reject) ->
        resolve {}

      # SessionRestangular
      #   .one("elections", electionId)
      #   .one('vote')
      #   .get()

    return
