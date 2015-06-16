angular.module 'tipstravel'

.classy.controller

  name: 'personPageCtrl'

  inject: [
    '$scope'
    '$state'
    'apiTips'
    'apiTopic'
    'apiUser'
    'apiLikes'
    'Global'
    'VisitReddit'
  ]

  data:
    api_setting:
      start: 0
      count: 10
      classify_name: null
      user_id: null
      visit_id: null
      scope: null

  init: ->
    @$scope.tips = "follow and share the interesting travel tips"
    @$scope.BaseURL = @Global.baseUrl

    @api_setting.classify_name = 'myTips'
    @api_setting.user_id = @Global.userId
    @api_setting.visit_id = @Global.userId
    @api_setting.scope = @$scope
    @$scope.reddit = new @VisitReddit @api_setting
