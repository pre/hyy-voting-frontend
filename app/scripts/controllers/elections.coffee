'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'ElectionsCtrl', ($scope, elections, VoteSrv, errorMonitor, Environment) ->

    @all = null
    @votes = null
    @loading = true
    @loadError = false
    @isElectionsActive = Environment.isElectionsActive()

    @init = ->
      if @isElectionsActive
        @loadElections()
      else
        @loading = false

    @loadElections = ->
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

    @init()

    return
