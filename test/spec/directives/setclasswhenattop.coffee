'use strict'

describe 'Directive: setClassWhenAtTop', ->

  # load the directive's module
  beforeEach module 'hyyVotingFrontendApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<set-class-when-at-top></set-class-when-at-top>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the setClassWhenAtTop directive'
