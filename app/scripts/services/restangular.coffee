'use strict'

###*
 # @ngdoc service
 # @name hyyVotingFrontendApp.restangular
 # @description
 # # restangular
 # Service in the hyyVotingFrontendApp.
###
angular.module 'hyyVotingFrontendApp'
  .run (Restangular) ->
    Restangular.setBaseUrl "http://localhost:3000/api" # TODO load from env

  .config (RestangularProvider) ->
    RestangularProvider.setDefaultHttpFields
      timeout: 10000 # milliseconds

  .service 'SessionRestangular', (Restangular, SessionSrv) ->
    return Restangular.withConfig (RestangularConfigurer) ->
      RestangularConfigurer.setDefaultHeaders
        'Authorization': "Bearer #{SessionSrv.getJwt()}"

  .service 'UnauthenticatedRestangular', (Restangular) ->
    return Restangular
