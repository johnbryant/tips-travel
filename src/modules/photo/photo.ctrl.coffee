angular.module 'tipstravel'

.classy.controller

  name: 'photoCtrl'

  inject: [
    '$scope'
    'apiSearch'
    'Global'
    'apiLikes'
    'apiUser'
    'PhotoReddit'
    '$state'
    'Reddit'

  ]

  data:
   photo_api_setting:
        start: 0
        count:20
        user_id: null
        scope: null
        tag_name:null


  init: ->
    @$scope.baseUrl = @Global.baseUrl
    @$scope.tips = "follow and share the interesting travel tips"
    tag = @$state.params.tag
    @photo_api_setting.tag_name = tag
    @photo_api_setting.user_id = @Global.userId
    @photo_api_setting.scope = @$scope
    @$scope.photo_reddit = new @PhotoReddit @photo_api_setting
    @$scope.btn_word = 'follow'
    @$scope.left='left'
    @$scope.right='right'
    @$scope.mid='mid'


    console.log 'photo init'
    console.log @$state.params.tag

  methods:

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
            @$scope.photo_reddit.items[index].follow_return.follow_btn_content = 'unfollow'
            @$scope.photo_reddit.items[index].user.isfollowed = "true"
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
            @$scope.photo_reddit.items[index].follow_return.follow_btn_content = 'follow'
            @$scope.photo_reddit.items[index].user.isfollowed = "false"
        .error (err) ->
          console.error err



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
          @$scope.photo_reddit.items[index].like_return.like_count++
          @$scope.photo_reddit.items[index].like_return.like_btn_url = 'styles/img/like_bkg.png'
          @$scope.photo_reddit.items[index].like_return.like_btn_content = 'unlike'
          console.log @$scope.photo_reddit.items[index].like_return.like_count
          console.log @$scope.photo_reddit.items[index].isliked
        else if result is 'dislikesuccess'
          @$scope.photo_reddit.items[index].like_return.like_count--
          @$scope.photo_reddit.items[index].like_return.like_btn_url = 'styles/img/unlike_bkg.png'
          @$scope.photo_reddit.items[index].like_return.like_btn_content = 'like'
          console.log @$scope.photo_reddit.items[index].like_return.like_count
          console.log @$scope.photo_reddit.items[index].isliked
      .error (err) ->
        console.error err

