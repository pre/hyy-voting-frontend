'use strict'

# Confirm click: Require two clicks on a button to submit an action.
#
# Idea copied from https://github.com/MrBoolean/ng-confirm/blob/master/index.js
$main = $('body, html')

angular.module('hyyVotingFrontendApp')
  .directive 'vtConfirmClick', ->
    priority: -1
    restrict: 'A'
    scope:
      isConfirmVisible: '=vtConfirmClick'

    link: ($scope, $container, args) ->
      $scope.isConfirmVisible = false

      onConfirm = ->
        $scope.isConfirmVisible = false
        $scope.$apply()

      onBodyClick = ->
        $container.off('click.onConfirm')
        $scope.isConfirmVisible = false
        $scope.$apply()

      $container.on 'click.triggerConfirm', (event) ->
        if ($scope.isConfirmVisible)
          return false

        $scope.isConfirmVisible = true
        $scope.$apply()

        $main.off('click.onBodyClick')

        event.stopImmediatePropagation()
        event.preventDefault()

        $main.one('click.onBodyClick', onBodyClick)
        $container.one('click.onConfirm', onConfirm)
