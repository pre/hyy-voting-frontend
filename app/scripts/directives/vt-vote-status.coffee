'use strict'

angular.module 'hyyVotingFrontendApp'
  .directive 'vtVoteStatus', ($sce) ->
    restrict: 'EA'
    scope:
      votes: '=vtVoteStatusVotes'
      election: '=vtVoteStatusElection'

    link: (scope, element, attrs) ->
      hasVoted = _.find scope.votes, 'election_id', scope.election.id

      if hasVoted?
        # Format date with eg. MomentJS to display timestamp
        # element.text hasVoted.updated_at
        element.text "X"
