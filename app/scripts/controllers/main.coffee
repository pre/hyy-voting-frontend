'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'MainCtrl', (Environment) ->
    @isSignInActive = Environment.isSignInActive()
    @isElectionActive = Environment.isElectionActive()
    @hasElectionStarted = Environment.hasElectionStarted()
    @hasElectionTerminated = Environment.hasElectionTerminated()
    @hasSignInEnded = Environment.hasSignInEnded()
    @electionSignInStartsAt = Environment.electionSignInStartsAt
    @dailyOpeningTime = Environment.dailyOpeningTime
    @dailyClosingTime = Environment.dailyClosingTime

    return
