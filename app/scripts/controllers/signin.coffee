'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'SignInCtrl', ($location, $window, SessionSrv, errorMonitor) ->
    @loading = true
    @token = $location.search().token
    @error = false
    @invalidToken = false
    @privateBrowsingModeError = false

    @redirectAccordingTo = (session) ->
      if session.type == "elections"
        $location.path('/elections')
      else if session.type == "eligibility"
        $location.path('/profile')
      else
        @error = true
        @invalidToken = true
        errorMonitor.error "Unknown session type: #{session.type}"

    SessionSrv.signIn(@token).then(
      (session) =>
        $location.search('token', null) # delete 'token' from current url

        @redirectAccordingTo(session)

      (failure) =>
        @error = true

        if failure.code == 22 && failure.name == "QuotaExceededError"
          console.error "private browsing mode :/"
          @privateBrowsingModeError = true
        else if failure.status != 403
          errorMonitor.error failure, "Sign in failed for other reason than HTTP 403"
          @invalidToken = true
        else
          @invalidToken = true

        console.error "Sign in failed: ", failure

    ).finally => @loading = false

    return
