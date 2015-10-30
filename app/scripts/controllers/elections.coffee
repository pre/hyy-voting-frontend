'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'ElectionsCtrl', ($scope, elections, VoteSrv) ->

    @all = null
    @votes = null
    @loading = true
    @loadError = false

    Promise.all [elections.get(), VoteSrv.all()]
      .then(
        (results) =>
          @all = results[0]
          @votes = results[1]
          console.log "got votes", @votes

        (failure) =>
          @loadError = failure
          # TODO: Report to Rollbar
          console.error "Failed getting elections:", failure

      ).finally =>
        @loading = false
        $scope.$apply()

    return
