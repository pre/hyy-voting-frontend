'use strict'

angular.module 'hyyVotingFrontendApp'
  .factory 'alliances', (SessionRestangular, SessionSrv) ->
    get: ->
      SessionRestangular
        .allUrl('alliances', SessionSrv.getAlliancesUrl())
        .getList()
