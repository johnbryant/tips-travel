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

    @$scope.single_current_index = null
    @$scope.selected_usernames = []
    @$scope.temp_single =
      {
      isfollowed: false
      button_name: ''
      }

    @$scope.is_select_all = false
    @$scope.final_btn_word = 'Select 5 Users'
    @$scope.buildHomeH1 = 'Building your home feed...'
    @$scope.remain_follow_num = 5
    @$scope.welcome_show = true
    @$scope.selectFollow_show = false
    @$scope.goBuildHome_show = false
#    @$scope.AllUser.current_item = null
#    @$scope.AllUser.button_name = 'follow'


  methods:
    goFollowBox: ->
      @$scope.welcome_show = false
      @$scope.selectFollow_show = true
      @$scope.goBuildHome_show = false

    # traversed the array and return the position of username
    traversedArray: (username) ->
      for username,i in @$scope.selected_usernames
        if username is @$scope.selected_usernames[i]
          return i



    # click the button for single user box
    dealFollowCheck: (index,selected_username,isfollowed) ->
      # if has not select 5 users
      if(@$scope.remain_follow_num > 1)
        if(isfollowed is false)
          console.log @$scope.remain_follow_num
          @$scope.remain_follow_num--
          @$scope.selected_usernames.push(selected_username)
          @$scope.single_current_index = index
          @$scope.temp_single.isfollowed = true
          @$scope.temp_single.button_name = 'unfollow'
          return @$scope.temp_single
        else
          console.log @$scope.remain_follow_num
          @$scope.remain_follow_num++
          @$scope.selected_usernames.splice(@traversedArray(selected_username),1)
          console.log @$scope.selected_usernames
          @$scope.temp_single.isfollowed = false
          @$scope.temp_single.button_name = 'follow'
          return @$scope.temp_single

      else
        @$scope.is_select_all = true

    goBuildHome: ->
      if @$scope.is_select_all is true
        @$scope.welcome_show = false
        @$scope.selectFollow_show = false
        @$scope.goBuildHome_show = true
        @$timeout(@goDashboard,3000)




    # add data to every single user data got from server
    initial_single: (user_object) ->
      user_object.single_info =
        {
        button_name: 'follow'
        isfollowed: false
        }



    # get the list of recommendation users' data provided by server
    getRecommendationUsers: ->
      console.log(@$scope.userid)
      Promise.bind @
      .then ->
        @apiUser.FirstUserFollow
          user_id : @$scope.userid
      .then (result) ->
        @$scope.AllUser = result.data
        @initial_single user_object for user_object in @$scope.AllUser
        console.log(@$scope.AllUser)
      .error (err) ->
        console.error err

    goDashboard: ->
      @$state.go 'dashboard'

#    sleep: (time) ->
#      now = getData
#      exitTime = now.getTime + time
#      while(true)
#        now = new Data()
#        if(now.getTime > exitTime)
#          return