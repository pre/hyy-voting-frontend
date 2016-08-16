'use strict'

angular
  .module 'hyyVotingFrontendApp', [
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'restangular',
    'pascalprecht.translate'
  ]

  .constant 'LOCALES', {
    'locales': {
      'fi': 'Suomi',
      'se': 'Svenska',
      'en': 'English'
    },
    'preferredLocale': 'fi'
  }

  .constant('DEBUG_MODE',
    #/*DEBUG_MODE*/
    true
    #/*DEBUG_MODE*/
  )

  .config ($translateProvider, DEBUG_MODE, LOCALES) ->
    $translateProvider.useStaticFilesLoader({
      prefix: 'resources/locale-',
      suffix: '.json'
    })

    $translateProvider.preferredLanguage(LOCALES.preferredLocale)
    $translateProvider.useMissingTranslationHandler('missingTranslationHandler')
    $translateProvider.useSanitizeValueStrategy('sanitize')
    $translateProvider.useLocalStorage()

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
      .when '/sign-out',
        templateUrl: 'views/sign-out.html'
        controller: 'SignOutCtrl'
        controllerAs: 'signOut'
      .when '/vote',
        templateUrl: 'views/vote.html'
        controller: 'VoteCtrl'
        controllerAs: 'vote'
      .when '/elections',
        templateUrl: 'views/elections.html'
        controller: 'ElectionsCtrl'
        controllerAs: 'elections'
      .when '/profile',
        templateUrl: 'views/profile.html'
        controller: 'ProfileCtrl'
        controllerAs: 'profile'
      .otherwise
        redirectTo: '/'
