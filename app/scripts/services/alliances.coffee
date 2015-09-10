'use strict'

angular.module 'hyyVotingFrontendApp'
  .factory 'alliances', (SessionRestangular, SessionSrv) ->
    get: ->
      new Promise (resolve, reject) ->
        url = SessionSrv.getAlliancesUrl()

        if url
          resolve SessionRestangular.allUrl('alliances', url).getList()
        else
          resolve SessionRestangular.allUrl('alliances', url).getList()
