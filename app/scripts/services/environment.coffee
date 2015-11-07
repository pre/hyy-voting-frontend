'use strict'

angular.module 'hyyVotingFrontendApp'
  .service 'Environment', ->

    @eligibilitySignInStartsAt = do ->
      moment('2015-11-07T07:00:00') # UTC

    @eligibilitySignInEndsAt = do ->
      moment('2015-11-09T09:00:00') # UTC

    @electionSignInStartsAt = do ->
      moment('2015-11-07T07:00:00') # UTC

    @electionSignInEndsAt = do ->
      moment('2015-11-07T07:00:00') # UTC

    # FIXME: Gets a deprecation warning from using a string in the date constructor
    @isEligibilityActive = ->
      moment().isAfter(@eligibilitySignInStartsAt) &&
        moment().isBefore(@eligibilitySignInEndsAt)

    @isElectionsActive = ->
      moment().isAfter(@electionSignInStartsAt) &&
        moment().isBefore(@electionSignInEndsAt)

    return
