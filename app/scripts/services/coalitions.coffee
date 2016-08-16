'use strict'

angular.module 'hyyVotingFrontendApp'
  .factory 'coalitions', (SessionRestangular) ->
    get: (electionId) ->
      SessionRestangular
        .one("elections", electionId)
        .all("coalitions")
        .getList(with_candidates: true)
