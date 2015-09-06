'use strict'

###*
 # @ngdoc function
 # @name hyyVotingFrontendApp.controller:VoteCtrl
 # @description
 # # VoteCtrl
 # Controller of the hyyVotingFrontendApp
###
angular.module 'hyyVotingFrontendApp'
  .controller 'VoteCtrl', (Restangular, candidates, alliances) ->

    @error = false
    @loading = true
    @alliances = []
    @candidates = [] # TODO Tämän vois poistaa ja hakea suoraan alliancesista

    # todo report error to user if failed
    Promise.all [alliances.get(), candidates.get()]
      .then(
        (results) =>
          @alliances = results[0]
          @candidates = results[1]

        (failure) =>
          console.error "Fetching alliances/candidates failed:", failure
          @error = true

      ).finally => @loading = false

    @isProspectSelected = ->
      @selected != undefined

    @register = ->
      console.log "You voted #{@selected}"

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
