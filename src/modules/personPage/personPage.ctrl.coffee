angular.module 'tipstravel'

.classy.controller

  name: 'personPageCtrl'

  inject: [
    '$scope'
    'apiTips'
    'Global'
    'Reddit'
  ]

  data:
    api_setting:
      start: 0
      count: 10
      classify_name: null
      user_id: null
      scope: null

  init: ->
    @$scope.tips = "follow and share the interesting travel tips"
    @$scope.BaseURL = @Global.baseUrl

    @api_setting.classify_name = 'myTips'
    @api_setting.user_id = 39
    @api_setting.scope = @$scope
    @$scope.reddit = new @Reddit @api_setting
