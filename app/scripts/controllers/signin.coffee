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
    @invalidToken = null

    Restangular.all('sessions/create').post(token: @token).then(
      (data) ->
        SessionSrv.save data

    ).then(
      (success) ->
        console.log "Redirect to 'vote'"
        $location.search('token', null)
        $location.path('/vote')

      (failure) =>
        # TODO: Report this error to Rollbar
        console.error "Sign in failed: #{failure.data.error.message}", failure
        @invalidToken = true

    ).finally => @loading = false

    return
