'use strict'

# Inspiration for translations from
# https://github.com/malyw/angular-translate-yeoman.git
angular.module 'hyyVotingFrontendApp'
  .directive 'vtTranslateLanguageSelect', (LocaleSrv) ->
    restrict: 'AE',
    replace: true,
    template: '''
      <div class="btn-group language-select">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span ng-bind="currentLocaleName"></span> <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
          <li ng-repeat="name in localeNames">
            <a ng-click="changeLanguage(name)" ng-bind="name"></a>
          </li>
        </ul>
      </div>
    '''

    controller: ($scope) ->
      $scope.currentLocaleName = LocaleSrv.getCurrentLocaleName()
      $scope.localeNames = LocaleSrv.getLocaleNames()
      $scope.localeKeys = LocaleSrv.getLocaleKeys()
      $scope.visible = $scope.localeNames?.length > 1

      $scope.changeLanguage = (name) ->
        LocaleSrv.setLocaleByDisplayName(name)
        $scope.currentLocaleName = name
