angular.module 'tipstravel'

.classy.controller

  name: 'topicCtrl'

  inject: [
    '$scope'
    '$state'
    'apiTopic'
    'apiUser'
    'apiLikes'
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
    @$scope.topic_name = @choose_topicname(num)







  methods:
    # follow users
    follow_user: (index,follow_userid,isfollowed) ->
      console.log follow_userid
      console.log isfollowed
      if isfollowed is "false"
        console.log 'begin follow'
        Promise.bind @
        .then ->
          @apiUser.dealFollowUser
            following_id: follow_userid
            user_id: @Global.userId
        .then (result) ->
          console.log result
          if result is 'followsuccess'
            @$scope.topic_reddit.items[index].follow_return.follow_btn_content = 'unfollow'
            @$scope.topic_reddit.items[index].user.isfollowed = "true"
        .error (err) ->
          console.error err
      else if isfollowed is 'true'
        console.log 'begin unfollow'
        Promise.bind @
        .then ->
          @apiUser.dealFollowUser
            following_id: follow_userid
            user_id: @Global.userId
        .then (result) ->
          console.log result
          if result is 'unfollowsuccess'
            @$scope.topic_reddit.items[index].follow_return.follow_btn_content = 'follow'
            @$scope.topic_reddit.items[index].user.isfollowed = "false"
        .error (err) ->
          console.error err


    # like tips
    like_tips: (index,messageid,like_count) ->
#      console.log "click1"
      Promise.bind @
      .then ->
        @apiLikes.likeTips
          message_id: messageid
          user_id: @Global.userId
      .then (result) ->
        console.log like_count
        console.log result
        if result is 'likesuccess'
          @$scope.topic_reddit.items[index].like_return.like_count++
          @$scope.topic_reddit.items[index].like_return.like_btn_url = 'styles/img/like_bkg.png'
          console.log @$scope.topic_reddit.items[index].like_return.like_count
          console.log @$scope.topic_reddit.items[index].isliked
        else if result is 'dislikesuccess'
          @$scope.topic_reddit.items[index].like_return.like_count--
          @$scope.topic_reddit.items[index].like_return.like_btn_url = 'styles/img/unlike_bkg.png'
          console.log @$scope.topic_reddit.items[index].like_return.like_count
          console.log @$scope.topic_reddit.items[index].isliked
      .error (err) ->
        console.error err

    choose_topicname: (index) ->
      switch index
        when '1' then return 'Trip in Europe'
        when '2' then return 'Cityscape'
        when '3' then return 'Sun and Sandybeach'
        when '4' then return 'Natural Landscape'
        when '5' then return 'View to Asia'
        when '6' then return 'Beyond the Ocean'
        when '7' then return 'Glacier World'
        when '8' then return 'Charming China'
        else return 'Suck my Dick'




