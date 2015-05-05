angular.module 'tipstravel'

.classy.controller

  name: 'dashboardCtrl'

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

    @$scope.BaseURL = @Global.baseUrl
    @$scope.tips = "follow and share the interesting travel tips"
    @$scope.topactive = false
    @$scope.middleactive = false
    @$scope.bottomactive = false
    @$scope.isopened = false
    @$scope.onclose = true
    @$scope.onopen = false
    @api_setting.classify_name = 'followingTips'
    @api_setting.user_id = 1
    @api_setting.scope = @$scope
    @$scope.reddit = new @Reddit @api_setting

  methods:

    opendNav: ->
      if !@$scope.isopened
        @$scope.topactive = true
        @$scope.middleactive = true
        @$scope.bottomactive = true
        @$scope.isopened = true
        @$scope.onopen = true
      else
        @$scope.topactive = false
        @$scope.middleactive = false
        @$scope.bottomactive = false
        @$scope.isopened = false
        @$scope.onopen = false
