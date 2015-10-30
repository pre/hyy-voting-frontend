'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'ElectionsCtrl', ($scope, elections) ->

    @all = null
    @loading = true
    @loadError = false

    elections.get().then(
      (data) =>
        @all = data

      (failure) =>
        @loadError = failure
        # TODO: Report to Rollbar
        console.error "Failed getting elections:", failure

    ).finally =>
      @loading = false
      $scope.$apply()

    return
