'use strict'

###*
 # @ngdoc function
 # @name hyyVotingFrontendApp.controller:SignUpCtrl
 # @description
 # # SignUpCtrl
 # Controller of the hyyVotingFrontendApp
###
angular.module 'hyyVotingFrontendApp'
  .controller 'SignUpCtrl', (SessionSrv, $scope, $location, errorMonitor) ->
    @loading = false
    @submitted = false
    @error = null
    @email = null

    # Display text and button related to the sign in link.
    # Disabled when Haka authentication is the primary way.
    # Requesting the link must also be allowed in API if enabled here.
    @allowLinkRequest = false

    @requestLink = (email) ->
      @loading = true

      SessionSrv.requestLink(email).then(
        (data) =>
          @submitted = true

        (failure) =>
          console.error "Failed requesting link", failure
          @error = failure

          if !!@error.data?.key
            @error.translation_key = @error.data.key
          else
            @error.is_unknown = true

      ).catch(
        (e) =>
          errorMonitor.error e, "Requesting session link failed"
          @error = e
      ).finally =>
        @loading = false

    return
