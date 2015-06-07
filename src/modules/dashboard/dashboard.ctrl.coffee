angular.module 'tipstravel'

.classy.controller

  name: 'dashboardCtrl'

  inject: [
    '$scope'
    'apiTips'
    'Global'
    'Reddit'
    'apiLikes'
    'Upload'
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