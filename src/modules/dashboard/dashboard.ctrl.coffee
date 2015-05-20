angular.module 'tipstravel'

.classy.controller

  name: 'dashboardCtrl'

  inject: [
    '$scope'
    'apiTips'
    'Global'
    'Reddit'
    'Upload'
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
    @api_setting.user_id = 2
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
            url : 'http://192.168.1.111:8080/tipstravel/message/upload'
#            data:
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
