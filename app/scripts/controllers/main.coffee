'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'MainCtrl', (Environment) ->
    @isSignInActive = Environment.isSignInActive()
    @isElectionActive = Environment.isElectionActive()
    @isEligibilityActive = Environment.isEligibilityActive()
    @hasElectionStarted = Environment.hasElectionStarted()
    @hasElectionEnded = Environment.hasElectionEnded()

    @eligibilitySignInStartsAt = Environment.eligibilitySignInStartsAt
    @electionSignInStartsAt = Environment.electionSignInStartsAt
    @dailyOpeningTime = Environment.dailyOpeningTime
    @dailyClosingTime = Environment.dailyClosingTime

    return
