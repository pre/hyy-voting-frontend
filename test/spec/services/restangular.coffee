'use strict'

describe 'Service: restangular', ->

  # load the service's module
  beforeEach module 'hyyVotingFrontendApp'

  # instantiate service
  restangular = {}
  beforeEach inject (_restangular_) ->
    restangular = _restangular_

  it 'should do something', ->
    expect(!!restangular).toBe true
