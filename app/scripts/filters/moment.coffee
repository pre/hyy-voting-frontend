'use strict'

angular.module 'hyyVotingFrontendApp'

  .filter 'moment', ->
    (dateString, format) ->
      moment(dateString).format(format)
