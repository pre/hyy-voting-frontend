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
    'ngTouch',
    'restangular'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        controllerAs: 'main'
      .when '/sign-up',
        templateUrl: 'views/sign-up.html'
        controller: 'SignUpCtrl'
        controllerAs: 'session'
      .when '/sign-in',
        templateUrl: 'views/sign-in.html'
        controller: 'SignInCtrl'
        controllerAs: 'session'
      .when '/results',
        templateUrl: 'views/results.html'
        controller: 'ResultCtrl'
        controllerAs: 'result'
      .when '/vote',
        templateUrl: 'views/vote.html'
        controller: 'VoteCtrl'
        controllerAs: 'vote'
      .otherwise
        redirectTo: '/'
