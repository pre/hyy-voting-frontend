'use strict'

###*
 # @ngdoc function
 # @name hyyVotingFrontendApp.controller:SigninCtrl
 # @description
 # # SigninCtrl
 # Controller of the hyyVotingFrontendApp
###
angular.module 'hyyVotingFrontendApp'
  .controller 'SignInCtrl', ($location, $window, SessionSrv) ->
    @loading = true
    @token = $location.search().token
    @invalidToken = null

    SessionSrv.signIn(@token).then(
      (success) ->
        console.log "Redirect to 'vote'"
        $location.search('token', null)
        $location.path('/elections')

      (failure) =>
        # TODO: Report to Rollbar unless failure.status == 401 unauthorized
        console.error "Sign in failed: ", failure
        @invalidToken = true

    ).finally => @loading = false

    return
