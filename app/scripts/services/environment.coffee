'use strict'

angular.module 'hyyVotingFrontendApp'
  .service 'Environment', ->

    @apiBaseUrl = do ->
      _VAALIT.api.baseUrl

    @dailyOpeningTime = do ->
      moment.tz(_VAALIT.voting.signIn.dailyOpeningTime, 'HH:mm', 'Europe/Helsinki')

    @dailyClosingTime = do ->
      moment.tz(_VAALIT.voting.signIn.dailyClosingTime, 'HH:mm', 'Europe/Helsinki')

    @electionSignInStartsAt = do ->
      moment.tz(_VAALIT.voting.signIn.startsAt, 'YYYY-MM-DD HH:mm', 'Europe/Helsinki')

    @electionSignInEndsAt = do ->
      moment.tz(_VAALIT.voting.signIn.endsAt, 'YYYY-MM-DD HH:mm', 'Europe/Helsinki')

    @electionTerminatesAt = do ->
      moment.tz(_VAALIT.voting.signIn.terminatesAt, 'YYYY-MM-DD HH:mm', 'Europe/Helsinki')

    @isElectionActive = ->
      moment().isAfter(@electionSignInStartsAt) &&
        moment().isBefore(@electionSignInEndsAt)

    @isSignInActive = ->
      @isElectionActive() &&
        moment().isAfter(@dailyOpeningTime) &&
        moment().isBefore(@dailyClosingTime)

    @hasElectionStarted = ->
      moment().isAfter(@electionSignInStartsAt)

    @hasElectionTerminated = ->
      moment().isAfter(@electionTerminatesAt)

    @hasSignInEnded = ->
      moment().isAfter(@electionSignInEndsAt)

    return
