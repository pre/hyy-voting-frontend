'use strict'

###*
 # @ngdoc function
 # @name hyyVotingFrontendApp.controller:VoteCtrl
 # @description
 # # VoteCtrl
 # Controller of the hyyVotingFrontendApp
###
angular.module 'hyyVotingFrontendApp'
  .controller 'VoteCtrl', (Restangular) ->

    @candidates = []

    Restangular.all('candidates.json').getList()
      .then((candidates) =>
        @candidates = candidates
      )

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
        scope.prospect = scope.all[newValue]
