angular.module 'tipstravel'

.classy.controller

  name: 'recommendationBoxCtrl'

  inject: [
    '$scope'
    '$state'
    'apiUser'
    'Global'
    '$timeout'
  ]

  init: ->
    @$scope.Baseurl = @Global.baseUrl
    @$scope.username = 'John'
    @$scope.userid = 2
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
#    @$scope.AllUser.current_item = null
#    @$scope.AllUser.button_name = 'follow'
    @$scope.selected_usernames = []

  methods:
    goFollowBox: ->
      @$scope.welcome_show = false
      @$scope.selectFollow_show = true
      @$scope.goBuildHome_show = false

    dealFollowCheck: (index,selected_username) ->
      if(@$scope.remain_follow_num > 0)
        @$scope.remain_follow_num--
        @$scope.single_unselect = false
        @$scope.single_select = true
        @$scope.AllUser.current_item = index
        @$scope.AllUser.button_name= 'unfollow'
        @$scope.selected_usernames.push(selected_username)


    goBuildHome: ->
      @$scope.welcome_show = false
      @$scope.selectFollow_show = false
      @$scope.goBuildHome_show = true
      @$timeout(@goDashboard,3000)

    goDashboard: ->
      @$state.go 'dashboard'


    getRecommendationUsers: ->
      console.log(@$scope.userid)
      Promise.bind @
      .then ->
        @apiUser.FirstUserFollow
          user_id : @$scope.userid
      .then (result) ->
        @$scope.AllUser = result.data
        @$scope.AllUser.button_name = 'follow'
        console.log(@$scope.AllUser)
      .error (err) ->
        console.error err

#    sleep: (time) ->
#      now = getData
#      exitTime = now.getTime + time
#      while(true)
#        now = new Data()
#        if(now.getTime > exitTime)
#          return