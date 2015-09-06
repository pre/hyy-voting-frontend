'use strict'

angular.module 'hyyVotingFrontendApp'
  .factory 'candidates', (SessionRestangular, SessionSrv) ->
    get: ->
      new Promise (resolve, reject) ->
        url = SessionSrv.getCandidatesUrl()

        if url
          resolve SessionRestangular.allUrl('candidates', url).getList()
        else
          reject "URL for candidates empty: #{url}"
