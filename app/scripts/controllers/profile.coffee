'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'ProfileCtrl', ($location, SessionSrv) ->

    @voter = SessionSrv.getVoter()

    @redirect = ->
      $location.path('/sign-up')

    @redirect() unless @voter

    return
