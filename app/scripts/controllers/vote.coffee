'use strict'

###*
 # @ngdoc function
 # @name hyyVotingFrontendApp.controller:VoteCtrl
 # @description
 # # VoteCtrl
 # Controller of the hyyVotingFrontendApp
###
angular.module 'hyyVotingFrontendApp'
  .controller 'VoteCtrl', ($scope, candidates, alliances, VoteSrv) ->

    @debug = false

    @loadError = false
    @loading = true
    @selected = null
    @submitting = @submitted = false
    @alliances = []
    @candidates = [] # TODO Tämän vois poistaa ja hakea suoraan alliancesista

    Promise.all [alliances.get(), candidates.get()]
      .then(
        (results) =>
          @alliances = results[0]
          @candidates = results[1]

        (failure) =>
          console.error "Fetching alliances/candidates failed:", failure
          @loadError = true
      )
      .finally =>
        @loading = false
        $scope.$apply()

    @isProspectSelected = ->
      @selected != null

    @select = (candidate) ->
      @selected = candidate.id

    @submit = (candidateId) ->
      @submitting = true

      VoteSrv.submit(candidateId).then(
        (success) ->
          console.log "Vote submitted for id", candidateId, success

        (failure) =>
          console.error "Vote failed for id", candidateId, failure
          @submitError = true

      ).catch(
        (e) =>
          #TODO report to rollbar
          console.error "Internal error. Vote failed!", e
          @submitError = true

      ).finally( =>
        @submitted = true
        @submitting = false
      )

    return

  .filter 'candidate', ->
    (candidate, filter) ->
      if candidate?.name == filter?.name && candidate?.number == filter?.number
        return candidate

  .directive 'voteProspect', ->
    restrict: 'E'
    template: 'Numero: {{ prospect.number }} <br> Nimi: {{ prospect.name }}'
    scope:
      selected: '=vtSelected'
      all: '=vtAll'

    link: (scope, element, attrs) ->
      scope.$watch 'selected', (newValue, oldValue) ->
        scope.prospect = _.find scope.all, 'id', newValue

  .directive 'voteConfirmClick', ->
    link: (scope, element, attr) ->
      msg = attr.voteConfirmClick || "Are you sure?"
      clickAction = attr.voteConfirmAction

      element.bind 'click', (event) ->
        if (window.confirm(msg))
          scope.$eval(clickAction)
