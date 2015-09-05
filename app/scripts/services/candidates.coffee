'use strict'

angular.module 'hyyVotingFrontendApp'
  .factory 'candidates', (SessionRestangular, SessionSrv) ->
    get: ->
      SessionRestangular
        .allUrl('candidates', SessionSrv.getCandidatesUrl())
        .getList()
