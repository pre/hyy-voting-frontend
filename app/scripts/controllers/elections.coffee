'use strict'

###*
 # @ngdoc function
 # @name hyyVotingFrontendApp.controller:ElectionsCtrl
 # @description
 # # ElectionsCtrl
 # Controller of the hyyVotingFrontendApp
###
angular.module 'hyyVotingFrontendApp'
  .controller 'ElectionsCtrl', (elections) ->

    @all = elections.get()


    # TODO:
    #  - list all elections
    #  - allow user to select election
    #  - if only one election, redirect directly to it

    return
