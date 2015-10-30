'use strict'

angular.module 'hyyVotingFrontendApp'
  .factory 'candidates', (SessionRestangular, elections) ->
    get: (electionId) ->
      SessionRestangular
        .one("elections", electionId)
        .all("candidates")
        .getList()
