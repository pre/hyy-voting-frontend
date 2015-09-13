use strict'

describe 'Controller: ResultCtrl', ->

  # load the controller's module
  beforeEach module 'hyyVotingFrontendApp'

  ResultCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ResultCtrl = $controller 'ResultCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(ResultCtrl.awesomeThings.length).toBe 3
