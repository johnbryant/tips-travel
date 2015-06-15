angular.module 'tipstravel'

.classy.controller

  name: 'userPageCtrl'

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
      visit_id: null
      user_id: null
      scope: null

  init: ->
    @$scope.tips = "follow and share the interesting travel tips"
    @$scope.BaseURL = @Global.baseUrl

    @api_setting.classify_name = 'userTips'
    @api_setting.user_id = @Global.userId
    @api_setting.visit_id = @$state.params.visit_id
    @api_setting.scope = @$scope
#    console.log @api_setting.visit_id + "hah"
    @$scope.reddit = new @VisitReddit @api_setting
