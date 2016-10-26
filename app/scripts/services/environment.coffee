'use strict'

angular.module 'hyyVotingFrontendApp'
  .service 'Environment', ->

    @apiBaseUrl = do ->
      _VAALIT.api.baseUrl

    @eligibilitySignInStartsAt = do ->
      moment.tz(_VAALIT.eligibility.signIn.startsAt, 'YYYY-MM-DD HH:mm', 'Europe/Helsinki')

    @eligibilitySignInEndsAt = do ->
      moment.tz(_VAALIT.eligibility.signIn.endsAt, 'YYYY-MM-DD HH:mm', 'Europe/Helsinki')

    @dailyOpeningTime = do ->
      moment.tz(_VAALIT.voting.signIn.dailyOpeningTime, 'HH:mm', 'Europe/Helsinki')

    @dailyClosingTime = do ->
      moment.tz(_VAALIT.voting.signIn.dailyClosingTime, 'HH:mm', 'Europe/Helsinki')

    @electionSignInStartsAt = do ->
      moment.tz(_VAALIT.voting.signIn.startsAt, 'YYYY-MM-DD HH:mm', 'Europe/Helsinki')

    @electionSignInEndsAt = do ->
      moment.tz(_VAALIT.voting.signIn.endsAt, 'YYYY-MM-DD HH:mm', 'Europe/Helsinki')

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
