angular.module 'tipstravel'

.classy.controller

  name: 'recommendationBoxCtrl'

  inject: [
    '$scope'
    '$state'
    'apiUser'
    'Global'
  ]

  init: ->
    @$scope.baseURL = @Global.baseUrl
    @$scope.username = @Global.userName

    @$scope.hello = 'Hello there, '
    @$scope.introduction = 'TipsTravel helps you discover and share interesting travel tips.Let\'s get started by setting up your home feed.'
    @$scope.user_intro = 'cool traveler from China'
    @$scope.follow_introH1 = 'Follow 5 users'
    @$scope.follow_introH2 = 'Then we\'ll build a custom home feed for you'
    @$scope.buildHomeH1 = 'Building your home feed...'
    @$scope.remain_follow_num = 5
    @$scope.welcome_show = true
    @$scope.selectFollow_show = false
    @$scope.goBuildHome_show = false

  methods:
    goFollowBox: ->
      @$scope.welcome_show = false
      @$scope.selectFollow_show = true
      @$scope.goBuildHome_show = false

    dealFollowCheck: ->
      if(@$scope.remain_follow_num > 0)
        @$scope.remain_follow_num--

    goBuildHome: ->
      @$scope.welcome_show = false
      @$scope.selectFollow_show = false
      @$scope.goBuildHome_show = true

    getRecommendationUsers: ->
#      console.log @$scope.baseURL
      Promise.bind @
      .then ->
        @$scope.allUsers = @apiUser.FirstUserFollow
        console.log @$scope.allUsers
      .error (err) ->
        console.error err