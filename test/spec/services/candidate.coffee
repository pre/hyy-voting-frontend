'use strict'

describe 'Service: candidate', ->

  # load the service's module
  beforeEach module 'hyyVotingFrontendApp'

  # instantiate service
  candidate = {}
  beforeEach inject (_candidate_) ->
    candidate = _candidate_

  it 'should do something', ->
    expect(!!candidate).toBe true
