angular.module 'tipstravel'

.classy.controller

  name: 'photoCtrl'

  inject: [
    '$scope'
    'apiUser'
  ]
    data:
      photo_api_setting:
        user_id: null
        tag_id: null
        scope: null
        isliked:null
        like_acount:null
  init: ->
    @$scope.tips = "follow and share the interesting travel tips"
    @$scope.BaseUrl = @Global.baseUrl
    @photo_api_setting.user_id = @Global.userId
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

    likeTip
