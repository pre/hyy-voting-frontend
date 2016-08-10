'use strict'

angular.module 'hyyVotingFrontendApp'
  .service 'Environment', ->

    @apiBaseUrl = do ->
      _VAALIT.api.baseUrl

    @eligibilitySignInStartsAt = do ->
      moment(_VAALIT.eligibility.signIn.startsAt, 'YYYY-MM-DD HH:mm').utcOffset('+0200')

    @eligibilitySignInEndsAt = do ->
      moment(_VAALIT.eligibility.signIn.endsAt, 'YYYY-MM-DD HH:mm').utcOffset('+0200')

    @electionSignInStartsAt = do ->
      moment(_VAALIT.voting.signIn.startsAt, 'YYYY-MM-DD HH:mm').utcOffset('+0200')

    @electionSignInEndsAt = do ->
      moment(_VAALIT.voting.signIn.endsAt, 'YYYY-MM-DD HH:mm').utcOffset('+0200')

    @isEligibilityActive = ->
      moment().isAfter(@eligibilitySignInStartsAt) &&
        moment().isBefore(@eligibilitySignInEndsAt)

    @isElectionsActive = ->
      moment().isAfter(@electionSignInStartsAt) &&
        moment().isBefore(@electionSignInEndsAt)

    @hasElectionsEnded = ->
      moment().isAfter(@electionSignInEndsAt)

    return
