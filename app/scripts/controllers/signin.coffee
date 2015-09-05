'use strict'

###*
 # @ngdoc function
 # @name hyyVotingFrontendApp.controller:SigninCtrl
 # @description
 # # SigninCtrl
 # Controller of the hyyVotingFrontendApp
###
angular.module 'hyyVotingFrontendApp'
  .controller 'SignInCtrl', ($location, $window, SessionSrv, Restangular) ->
    @loading = true
    @token = $location.search().token
    @jsonRaw = "no data yet"
    @invalidToken = null

    Restangular.one('mock_token', @token).get().then(
      (data) =>
        console.log "Set goodToken", data.goodToken
        @jsonRaw = data
        SessionSrv.save data

    ).then(
      (success) ->
        console.log "Redirect to 'vote'"
        $location.search('token', null)
        $location.path('/vote')

      (error) =>
        # TODO: Report this error to Rollbar
        console.error "Sign in failed: #{error.message}", error
        @jsonRaw = error
        @invalidToken = true
    ).finally => @loading = false

    return
