'use strict'

# This controller is entered after either
# a) user has clicked the sign in link from email, or
# b) user-agent is being redirected here after Haka authentication.
#
# Sign in link contains a JWT token as a URL query parameter `token`.
# See API's `SessionToken` and `SignInTokenProcessor` for details about token's
# contents.
#
# If the JWT token is valid, it is stored in the browser's Session Storage
# by `SessionSrv`. Browser will automatically clear Session Storage after
# the tab/window is closed.
#
# After token has been processed, user is redirected to the list of elections.
#
# A voter cannot sign in before the voting has started.
#
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
