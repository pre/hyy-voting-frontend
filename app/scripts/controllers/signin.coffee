'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'SignInCtrl', ($location, $window, SessionSrv, errorMonitor) ->
    @loading = true
    @token = $location.search().token
    @invalidToken = false

    @redirectAccordingTo = (session) ->
      if session.type == "elections"
        $location.path('/elections')
      else if session.type == "eligibility"
        $location.path('/profile')
      else
        @invalidToken = true
        errorMonitor.error "Unknown session type: #{session.type}"

    SessionSrv.signIn(@token).then(
      (session) =>
        $location.search('token', null)

        @redirectAccordingTo(session)

      (failure) =>
        @invalidToken = true

        if failure.status != 403
          errorMonitor.error failure, "Sign in failed for other reason than HTTP 403"

        console.error "Sign in failed: ", failure

    ).finally => @loading = false

    return
