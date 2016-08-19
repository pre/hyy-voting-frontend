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
      Promise.all [elections.get()] #TODO:Halloped VoteSrv.all_voting_rights
        .then(
          (results) =>
            @all = results[0]
            # @voting_right = results[1] # TODO:Halloped

          (failure) =>
            @loadError = failure

        ).finally =>
          @loading = false
          $scope.$apply()

    @init()

    return
