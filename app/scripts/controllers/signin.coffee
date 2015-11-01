'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'SignInCtrl', ($location, $window, SessionSrv, errorMonitor) ->
    @loading = true
    @token = $location.search().token
    @invalidToken = null

    SessionSrv.signIn(@token).then(
      (success) ->
        $location.search('token', null)
        $location.path('/elections')

      (failure) =>
        console.error "Sign in failed: ", failure
        @invalidToken = true

        if failure.status != 403
          errorMonitor.error failure, "Sign in failed for other reason than HTTP 403"

    ).finally => @loading = false

    return
