'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'ElectionsCtrl', ($scope, elections, VoteSrv, errorMonitor) ->

    @all = null
    @votes = null
    @loading = true
    @loadError = false

    Promise.all [elections.get(), VoteSrv.all()]
      .then(
        (results) =>
          @all = results[0]
          @votes = results[1]

        (failure) =>
          @loadError = failure

      ).finally =>
        @loading = false
        $scope.$apply()

    return
