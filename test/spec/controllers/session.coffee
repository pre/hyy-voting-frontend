'use strict'

describe 'Controller: SessionCtrl', ->

  # load the controller's module
  beforeEach module 'hyyVotingFrontendApp'

  SessionCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SessionCtrl = $controller 'SessionCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(SessionCtrl.awesomeThings.length).toBe 3
