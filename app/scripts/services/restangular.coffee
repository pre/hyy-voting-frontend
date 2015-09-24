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
    Restangular.setBaseUrl "http://localhost:3001" # TODO load from env

  .config (RestangularProvider) ->
    RestangularProvider.setDefaultHttpFields
      timeout: 10000 # milliseconds

  .service 'SessionRestangular', (Restangular, SessionSrv) ->
    return Restangular.withConfig (RestangularConfigurer) ->
      RestangularConfigurer.setDefaultHeaders
        'goodToken': SessionSrv.getToken()

  .service 'UnauthenticatedRestangular', (Restangular) ->
    return Restangular
