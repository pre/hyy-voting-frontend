'use strict'

# Display an error after a failed sign in.
# Failure keys are defined in API's Haka::AuthController.
angular.module 'hyyVotingFrontendApp'
  .controller 'SignInErrorCtrl', ($location) ->
    @failure = $location.search().failure

    @noVotingRight = null
    @invalidSamlResponse = null
    @general = null

    switch @failure
      when "no_voting_right" then @noVotingRight = true
      when "invalid_saml_response" then @invalidSamlResponse = true
      else
        console.debug "Unknown failure:", @failure
        @general = true

    return
