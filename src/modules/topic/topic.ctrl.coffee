angular.module 'tipstravel'

.classy.controller

  name: 'topicCtrl'

  inject: [
    '$scope'
    'apiTopic'
    'Global'
    'TopicReddit'
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
    @$scope.BaseUrl = @Global.baseUrl
    @topic_api_setting.classify_name = 'topicTips'
    @topic_api_setting.user_id = @Global.userId
    @topic_api_setting.topic_id = 2
    @topic_api_setting.scope = @$scope
    @$scope.topic_reddit = new @TopicReddit @topic_api_setting


