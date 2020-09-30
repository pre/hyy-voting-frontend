'use strict'

angular.module 'hyyVotingFrontendApp'
  .controller 'VoteCtrl', ($scope, $location, candidates, coalitions, VoteSrv, errorMonitor) ->

    @debug = false

    @electionId = $location.search().election
    @loadError = false
    @loading = true
    @selected = null
    @submitting = @submitted = false
    @coalitions = []
    @candidates = []
    @savedVote = null
    @votingRight = null

    Promise.all [
      coalitions.get(@electionId),
      candidates.get(@electionId),
      VoteSrv.getVotingRight(@electionId)
    ]
      .then(
        (results) =>
          @coalitions = results[0]
          @candidates = results[1]
          @votingRight = results[2]

        (failure) =>
          @loadError = true
          errorMonitor.error failure, "Fetching coalitions/candidates failed"
      )
      .finally =>
        @loading = false
        $scope.$apply()

    @isProspectSelected = ->
      @selected != null

    # NOTE:
    # Conditions used for disallowing candidate select must match the rules of
    # `ng-disabled` in views/vote.html (ng-model `vote.selected`).
    @select = (candidate) ->
      return if @submitting || @submitted || @votingRight.used

      @selected = candidate.id

    @isUnsaved = ->
      return false if !@selected or !@savedVote or _.isEmpty(@savedVote)

      @selected != @savedVote.candidate_id

    @submit = (candidateId) ->
      @submitting = true

      VoteSrv.submit(@electionId, candidateId).then(
        (data) =>
          @votingRight = data

        (failure) =>
          @submitError = true

          # Sometimes failure does not contain `error` and sometimes
          # it does not contain `error.voting_right`. Report `failure` to
          # errorMonitor before accessing contents of `failure.data`.
          # Error will be reported again in the `catch` block if
          # `failure.data.error.voting_right` is not present.
          #
          # https://app.asana.com/0/93660496528742/203329110576045
          errorMonitor.error failure, "Vote failed"
          @votingRight = failure.data.error.voting_right

      ).catch(
        (e) =>
          @submitError = true
          errorMonitor.error e, "Vote failed for unknown error."

      ).finally( =>
        @submitted = true
        @submitting = false
      )

    return

  .filter 'candidate', ->
    (candidate, filter) ->
      if candidate?.name == filter?.name && candidate?.number == filter?.number
        return candidate

  .directive 'voteProspect', ->
    restrict: 'E'
    template: '''
      <span translate>.vote-ballot.header-number</span>: <strong>{{ prospect.number }}</strong>
      <br>
      <span translate>.vote-ballot.header-name</span>: <strong>{{ prospect.name }}</strong>
    '''
    scope:
      selected: '=vtSelected'
      all: '=vtAll'

    link: (scope, element, attrs) ->
      scope.$watch 'selected', (newValue, oldValue) ->
        scope.prospect = _.find scope.all, 'id', newValue
