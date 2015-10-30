'use strict'

angular.module 'hyyVotingFrontendApp'
  .factory 'alliances', (SessionRestangular, elections) ->
    get: (electionId) ->
      new Promise (resolve, reject) ->
        url = elections.getAlliancesUrl(electionId)

        if url
          resolve SessionRestangular.allUrl('alliances', url).getList()
        else
          reject "URL for alliances empty: #{url}"
