'use strict'

angular.module 'hyyVotingFrontendApp'
  .factory 'candidates', (SessionRestangular, elections) ->
    get: (electionId) ->
      new Promise (resolve, reject) ->
        url = elections.getCandidatesUrl(electionId)

        if url
          resolve SessionRestangular.allUrl('candidates', url).getList()
        else
          reject "URL for candidates empty: #{url}"
