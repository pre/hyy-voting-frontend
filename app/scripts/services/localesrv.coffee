'use strict'

angular.module 'hyyVotingFrontendApp'
  .service 'LocaleSrv', ($translate, LOCALES) ->

    @findKeyByValue = (value) ->
      for k, v of LOCALES.locales
        return k if v == value

    @getLocaleNames = ->
      _.values LOCALES.locales

    @getLocaleKeys = ->
      _.keys LOCALES.locales

    @getCurrentLocaleName = ->
      LOCALES.locales[$translate.proposedLanguage()]

    @setLocaleByDisplayName = (name) ->
      $translate.use @findKeyByValue name

    return
