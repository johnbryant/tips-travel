angular.module 'tipstravel'

.classy.controller

  name: 'photoCtrl'

  inject: [
    '$scope'
    'apiSearch'
    'Global'
    'apiLikes'
    'apiUser'

  ]

  data:
   photo_api_setting:
        start: 0
        count:20
        userid: null
        scope: null


  init: ->
    @$scope.tips = "follow and share the interesting travel tips"
    @$scope.photo_reddit = new @PhotoReddit @photo_api_setting
    @$scope.baseUrl = @Global.baseUrl
    @photo_api_setting.user_id = @Global.userId
    @photo_api_setting.scope = @$scope
    @$scope.btn_word = 'follow'

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
            console.log @$scope.photo_reddit.items[index].like_return.like_count
            console.log @$scope.photo_reddit.items[index].isliked
          else if result is 'dislikesuccess'
            @$scope.photo_reddit.items[index].like_return.like_count--
            console.log @$scope.photo_reddit.items[index].like_return.like_count
            console.log @$scope.photo_reddit.items[index].isliked
        .error (err) ->
          console.error err