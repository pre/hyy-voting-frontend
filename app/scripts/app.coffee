'use strict'

###*
 # @ngdoc overview
 # @name hyyVotingFrontendApp
 # @description
 # # hyyVotingFrontendApp
 #
 # Main module of the application.
###
angular
  .module 'hyyVotingFrontendApp', [
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        controllerAs: 'main'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
        controllerAs: 'about'
      .otherwise
        redirectTo: '/'

