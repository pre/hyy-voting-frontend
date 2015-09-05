'use strict'

describe 'Controller: SigninCtrl', ->

  # load the controller's module
  beforeEach module 'hyyVotingFrontendApp'

  SigninCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    SigninCtrl = $controller 'SigninCtrl', {
      # place here mocked dependencies
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(SigninCtrl.awesomeThings.length).toBe 3
