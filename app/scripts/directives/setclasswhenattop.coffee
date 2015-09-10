'use strict'

###*
 # @ngdoc directive
 # @name hyyVotingFrontendApp.directive:setClassWhenAtTop
 # @description
 # # setClassWhenAtTop
###
angular.module 'hyyVotingFrontendApp'
  .directive 'setClassWhenAtTop', ($window) ->
    $win = angular.element($window)
    restrict: "A"

    link: (scope, element, attrs) ->
      topClass = attrs.setClassWhenAtTop
      topPadding = parseInt(attrs.paddingWhenAtTop, 10)
      parent = element.parent()
      offsetTop = null

      $win.on "scroll", ->
        # take offset of parent because after the element gets fixed
        # it now has a different offset from the top
        offsetTop = parent.offset().top - topPadding
        if ($win.scrollTop() >= offsetTop)
          element.addClass(topClass)
          parent.height(element.height())
        else
          element.removeClass(topClass)
          parent.css("height", null)
