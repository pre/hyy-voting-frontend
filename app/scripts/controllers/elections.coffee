'use strict'

###*
 # @ngdoc function
 # @name hyyVotingFrontendApp.controller:ElectionsCtrl
 # @description
 # # ElectionsCtrl
 # Controller of the hyyVotingFrontendApp
###
angular.module 'hyyVotingFrontendApp'
  .controller 'ElectionsCtrl', ($scope, elections) ->

    @all = null
    @loadError = false

    elections.get().then(
      (data) =>
        @all = data
        $scope.$apply()

      (failure) =>
        console.error "Failed getting elections:", failure
        @loadError = failure
    )


    # TODO:
    #  - list all elections
    #  - allow user to select election
    #  - if only one election, redirect directly to it

    return
