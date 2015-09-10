'use strict'

###*
 # @ngdoc function
 # @name hyyVotingFrontendApp.controller:VoteCtrl
 # @description
 # # VoteCtrl
 # Controller of the hyyVotingFrontendApp
###
angular.module 'hyyVotingFrontendApp'
  .controller 'VoteCtrl', ($scope, Restangular, candidates, alliances) ->

    @error = false
    @loading = true
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
          @error = true
      )
      .finally =>
        @loading = false
        $scope.$apply()

    @isProspectSelected = ->
      @selected != undefined

    @register = ->
      @submitting = true
      console.log "You voted #{@selected}"
      Promise.delay(1000).then(
        =>
          @submitting = false
          @submitted = true
          console.log "Vote submitted!"
          $scope.$apply()
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
      selected: '='
      all: '='

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
