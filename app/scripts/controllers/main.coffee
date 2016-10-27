'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'MainCtrl', (Environment) ->
    @isSignInActive = Environment.isSignInActive()
    @isElectionActive = Environment.isElectionActive()
    @isEligibilityActive = Environment.isEligibilityActive()
    @hasElectionStarted = Environment.hasElectionStarted()
    @hasElectionTerminated = Environment.hasElectionTerminated()
    @hasSignInEnded = Environment.hasSignInEnded()

    @eligibilitySignInStartsAt = Environment.eligibilitySignInStartsAt
    @electionSignInStartsAt = Environment.electionSignInStartsAt
    @dailyOpeningTime = Environment.dailyOpeningTime
    @dailyClosingTime = Environment.dailyClosingTime

    return
