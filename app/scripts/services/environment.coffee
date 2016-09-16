'use strict'

angular.module 'hyyVotingFrontendApp'
  .service 'Environment', ->

    @apiBaseUrl = do ->
      _VAALIT.api.baseUrl

    @eligibilitySignInStartsAt = do ->
      moment(_VAALIT.eligibility.signIn.startsAt, 'YYYY-MM-DD HH:mm')

    @eligibilitySignInEndsAt = do ->
      moment(_VAALIT.eligibility.signIn.endsAt, 'YYYY-MM-DD HH:mm')

    @dailyOpeningTime = do ->
      moment(_VAALIT.voting.signIn.dailyOpeningTime, 'HH:mm')

    @dailyClosingTime = do ->
      moment(_VAALIT.voting.signIn.dailyClosingTime, 'HH:mm')

    @electionSignInStartsAt = do ->
      moment(_VAALIT.voting.signIn.startsAt, 'YYYY-MM-DD HH:mm')

    @electionSignInEndsAt = do ->
      moment(_VAALIT.voting.signIn.endsAt, 'YYYY-MM-DD HH:mm')

    @isEligibilityActive = ->
      moment().isAfter(@eligibilitySignInStartsAt) &&
        moment().isBefore(@eligibilitySignInEndsAt)

    @isElectionActive = ->
      moment().isAfter(@electionSignInStartsAt) &&
        moment().isBefore(@electionSignInEndsAt)

    @isSignInActive = ->
      @isElectionActive() &&
        moment().isAfter(@dailyOpeningTime) &&
        moment().isBefore(@dailyClosingTime)

    @hasElectionStarted = ->
      moment().isAfter(@electionSignInStartsAt)

    @hasElectionEnded = ->
      moment().isAfter(@electionSignInEndsAt)

    return
