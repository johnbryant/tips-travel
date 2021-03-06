angular.module 'tipstravel'

.classy.controller

  name: 'dashboardCtrl'

  inject: [
    '$scope'
    '$state'
    'apiTips'
    'Global'
    'Reddit'
    'apiLikes'
    'apiUser'
    'Upload'
    '$timeout'
    'apiSearch'
    'PhotoReddit'
    '$timeout'
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
    @$scope.chooseImgs = []
    @api_setting.classify_name = 'followingTips'
    @api_setting.user_id = @Global.userId
    @api_setting.scope = @$scope
    @$scope.reddit = new @Reddit @api_setting



    @$scope.content = null

  methods:
  # upload the tip
    upload: ->
      if (@$scope.chooseImgs && @$scope.chooseImgs.length)
        tags =  @$scope.content.split('#')
        tags.shift()
        content = tags.pop()

        for img in @$scope.chooseImgs
          @Upload.upload
            url : @Global.baseUrl+'/message/upload'
            fields:
              userid: @Global.userId
              tags: tags
              content: content
            file: img
          console.log 'timeout'
          @$state.reload()
#          @$timeout(@$state.reload(),10000)

  # open the side nav bar
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
            @$scope.reddit.items[index].follow_btn_content = 'unfollow'
            @$scope.reddit.items[index].user.isfollowed = "true"
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
            @$scope.reddit.items[index].follow_btn_content = 'follow'
            @$scope.reddit.items[index].user.isfollowed = "false"
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
          @$scope.reddit.items[index].like_return.like_count++
          @$scope.reddit.items[index].like_return.like_btn_url = 'styles/img/like_bkg.png'
          console.log @$scope.reddit.items[index].like_return.like_count
          console.log @$scope.reddit.items[index].isliked
        else if result is 'dislikesuccess'
          @$scope.reddit.items[index].like_return.like_count--
          @$scope.reddit.items[index].like_return.like_btn_url = 'styles/img/unlike_bkg.png'
          console.log @$scope.reddit.items[index].like_return.like_count
          console.log @$scope.reddit.items[index].isliked
      .error (err) ->
        console.error err

    goPersonPage: (userid) ->
      @$state.go 'userPage', visit_id:userid
      console.log userid

    goPhotoWall: (tagname)->
      console.log 'photo wall'
      Promise.bind @
      .then ->
        @apiSearch.search
          tag_name: tagname
          start_index: 0
          user_id: @Global.userId
      .then (result) ->
        console.log result.data
        @$state.go 'photo', tag: tagname
      .error (err) ->
        console.error err
