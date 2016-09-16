'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'MainCtrl', (Environment) ->
    @isElectionsActive = Environment.isElectionsActive()
    @isEligibilityActive = Environment.isEligibilityActive()
    @hasElectionsEnded = Environment.hasElectionsEnded()

    @isSignInActive = @isEligibilityActive || @isElectionsActive
    @eligibilitySignInStartsAt = Environment.eligibilitySignInStartsAt
    @electionSignInStartsAt = Environment.electionSignInStartsAt

    return
