'use strict'

###*
 # @ngdoc function
 # @name hyyVotingFrontendApp.controller:SessionCtrl
 # @description
 # # SessionCtrl
 # Controller of the hyyVotingFrontendApp
###
angular.module 'hyyVotingFrontendApp'
  .controller 'SessionCtrl', (SessionSrv, $scope, $location) ->
    @loading = false
    @submitted = false
    @error = null
    @email = null

    @requestLink = (email) ->
      @loading = true

      SessionSrv.requestLink(email).then(
        (data) =>
          console.log "Success sending link", data
          @submitted = true
          $scope.$apply() # TODO: Remove after Restangular

        (failure) =>
          console.error "Failed sending link", failure
          @error = failure.message
      ).catch(
        (e) -> console.error "Wat happened", e
      ).finally =>
        @loading = false

    return
