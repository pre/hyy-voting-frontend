'use strict'

angular.module 'hyyVotingFrontendApp'
  .factory 'alliances', (SessionRestangular, elections) ->
    get: (electionId) ->
      SessionRestangular
        .one("elections", electionId)
        .all("alliances")
        .getList()
