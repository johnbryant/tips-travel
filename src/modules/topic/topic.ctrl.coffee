angular.module 'tipstravel'

.classy.controller

  name: 'topicCtrl'

  inject: [
    '$scope'
    'apiTips'
    'Global'
    'Reddit'
  ]

  data:
    topic_api_setting:
      start: 0
      count: 10
      classify_name: null
      user_id: null
      topic_id: null
      scope: null

  init: ->
    @$scope.name = 'Michael Corleone'
    @$scope.text = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod'
    @$scope.right = true
    @$scope.left = false

    @$topic_api_setting.classify_name = ''
    @$topic_api_setting.user_id = @Global.userId
    @$topic_api_setting.scope = @$scope
    @$scope.reddit = new @Reddit @topic_api_setting


