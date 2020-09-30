'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'ElectionsCtrl', ($scope, elections, VoteSrv, errorMonitor, Environment) ->

    @all = null
    @votes = null
    @loading = true
    @loadError = false
    @isElectionActive = Environment.isElectionActive()

    @init = ->
      if @isElectionActive
        @loadElections()
      else
        @loading = false

    @loadElections = ->
      Promise.all [elections.get()]
        .then(
          (results) =>
            @all = results[0]

          (failure) =>
            @loadError = failure

        ).finally =>
          @loading = false
          $scope.$apply()

    @init()

    return
