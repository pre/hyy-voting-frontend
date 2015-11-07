'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'MainCtrl', (Environment) ->
    @isElectionsActive = Environment.isElectionsActive()
    @isEligibilityActive = Environment.isEligibilityActive()
    @isSignInActive = @isEligibilityActive || @isElectionsActive
    @eligibilitySignInStartsAt = Environment.eligibilitySignInStartsAt.format('DD.MM.YYYY hh:mm')
    @electionSignInStartsAt = Environment.electionSignInStartsAt.format('DD.MM.YYYY hh:mm')

    return
