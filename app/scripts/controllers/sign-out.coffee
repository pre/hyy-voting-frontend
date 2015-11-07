'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'SignOutCtrl', (SessionSrv) ->

    @cleared = false

    SessionSrv.signOut().then => @cleared = true

    return
