'use strict'

angular.module 'hyyVotingFrontendApp'
  .service 'Environment', ->

    # TODO: Read these from an injected js file
    @eligibilitySignInStartsAt = do ->
      moment('2015-11-12 07:00', 'YYYY-MM-DD HH:mm').utcOffset('+0200')

    @eligibilitySignInEndsAt = do ->
      moment('2015-12-14 17:00', 'YYYY-MM-DD HH:mm').utcOffset('+0200')

    @electionSignInStartsAt = do ->
      moment('2015-12-16 09:00', 'YYYY-MM-DD HH:mm').utcOffset('+0200')

    @electionSignInEndsAt = do ->
      moment('2015-12-16 17:00', 'YYYY-MM-DD HH:mm').utcOffset('+0200')

    @isEligibilityActive = ->
      moment().isAfter(@eligibilitySignInStartsAt) &&
        moment().isBefore(@eligibilitySignInEndsAt)

    @isElectionsActive = ->
      moment().isAfter(@electionSignInStartsAt) &&
        moment().isBefore(@electionSignInEndsAt)

    return
