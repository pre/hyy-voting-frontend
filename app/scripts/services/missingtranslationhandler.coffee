'use strict'

angular.module 'hyyVotingFrontendApp'
  .factory 'missingTranslationHandler', ($translate, errorMonitor) ->

    # TODO: Return value from primary language if key missing
    (translationKey, lang) ->
      errorMonitor.warning "Missing translation key: '#{translationKey}' (lang: '#{lang}')"
      return "MISSING: '#{translationKey}'"
