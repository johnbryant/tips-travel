angular.module 'tipstravel'

.classy.controller

  name: 'topicCtrl'

  inject: [
    '$scope'
    '$state'
    'apiTopic'
    'apiUser'
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
    @$scope.baseUrl = @Global.baseUrl
    @$scope.name = 'Michael Corleone'
    @$scope.text = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod'
    num = @$state.params.num
    @$scope.BaseUrl = @Global.baseUrl
    @topic_api_setting.classify_name = 'topicTips'
    @topic_api_setting.user_id = @Global.userId
    @topic_api_setting.topic_id = num
    @topic_api_setting.scope = @$scope
    @$scope.topic_reddit = new @TopicReddit @topic_api_setting
    @$scope.btn_word = 'follow'
    @$scope.userids = []

  methods:
    follow_user: (follow_userid,isfollowed) ->
      if isfollowed is false
        while @$scope.userids isnt null
          @$scope.userids.pop
        @$scope.userids.push(follow_userid)
        console.log @$scope.userids
        Promise.bind @
        .then ->
          @apiUser.sendFollowUser
            user_id: @Global.userId
            all_follow_users: @$scope.userids
        .then (result) ->
          console.log result
          if result is 'success'
            @$scope.btn_word = 'unfollow'
        .error (err) ->
          console.error err






