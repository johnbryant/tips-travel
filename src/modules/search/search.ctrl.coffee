angular.module 'tipstravel'

.classy.controller

  name: 'searchCtrl'

  inject: [
    '$scope'
    '$state'
    'apiSearch'
    'Global'
    'PhotoReddit'
  ]


  init: ->
    @$scope.test = "Search"
    @$scope.errorInfo = null
    console.log 'good'
    @$scope.city="城市"
    @$scope.ocea="海洋"
    @$scope.natu="自然"
    @$scope.moun="山脉"
    @$scope.honk="香港"
    @$scope.arct="建筑"
    @$scope.activestatus="None"
    @$scope.activestatus1=""



  methods:
    goTopic: (num) ->
      @$state.go 'topic', num:num  console.log num


    searchFor:() ->
      console.log 'search'
      Promise.bind @
      .then ->
        @apiSearch.search
          tag_name: @$scope.tag_name
          start_index:0
          user_id:@Global.userId
          console.log @$scope.tag_name
      .then (result) ->
        console.log result.data
        if result.message is 'fail'
          @$scope.errorInfo = 'There is no such Tag!'
          console.log @$scope.errorInfo
        else
          @$scope.errorInfo = null
          @$state.go 'photo', tag: @$scope.tag_name

      .error (err) ->
        console.error err


    searchForTag1:() ->
      Promise.bind @
      .then ->
        @apiSearch.search
          tag_name: @$scope.city
          start_index:0
          user_id:@Global.userId
          console.log @$scope.city
      .then (result) ->
        console.log result
        if result.message is 'fail'
          @$scope.errorInfo = 'There is no such Tag!'
          console.log @$scope.errorInfo
        else
          @$scope.errorInfo = null
          @$state.go 'photo', tag: @$scope.city
      .error (err) ->
        console.error err

    searchForTag2:() ->
      Promise.bind @
      .then ->
        @apiSearch.search
          tag_name: @$scope.ocea
          start_index:0
          user_id:@Global.userId
          console.log @$scope.ocea
      .then (result) ->
        console.log result
        if result.message is 'fail'
          @$scope.errorInfo = 'There is no such Tag!'
          console.log @$scope.errorInfo
        else
          @$scope.errorInfo = null
          @$state.go 'photo', tag: @$scope.ocea
      .error (err) ->
        console.error err

    searchForTag3:() ->
      Promise.bind @
      .then ->
        @apiSearch.search
          tag_name: @$scope.natu
          start_index:0
          user_id:@Global.userId
          console.log @$scope.natu
      .then (result) ->
        console.log result
        if result.message is 'fail'
          @$scope.errorInfo = 'There is no such Tag!'
          console.log @$scope.errorInfo
        else
          @$scope.errorInfo = null
          @$state.go 'photo', tag: @$scope.natu
      .error (err) ->
        console.error err

    searchForTag4:() ->
      Promise.bind @
      .then ->
        @apiSearch.search
          tag_name: @$scope.moun
          start_index:0
          user_id:@Global.userId
          console.log @$scope.moun
      .then (result) ->
        console.log result
        if result.message is 'fail'
          @$scope.errorInfo = 'There is no such Tag!'
          console.log @$scope.errorInfo
        else
          @$scope.errorInfo = null
          @$state.go 'photo', tag: @$scope.moun
      .error (err) ->
        console.error err

    searchForTag5:() ->
      Promise.bind @
      .then ->
        @apiSearch.search
          tag_name: @$scope.honk
          start_index:0
          user_id:@Global.userId
          console.log @$scope.honk
      .then (result) ->
        console.log result
        if result.message is 'fail'
          @$scope.errorInfo = 'There is no such Tag!'
          console.log @$scope.errorInfo
        else
          @$scope.errorInfo = null
          @$state.go 'photo', tag: @$scope.honk
      .error (err) ->
        console.error err

    searchForTag6:() ->
      Promise.bind @
      .then ->
        @apiSearch.search
          tag_name: @$scope.arct
          start_index:0
          user_id:@Global.userId
          console.log @$scope.arct
      .then (result) ->
        console.log result
        if result.message is 'fail'
          @$scope.errorInfo = 'There is no such Tag!'
          console.log @$scope.errorInfo
        else
          @$scope.errorInfo = null
          @$state.go 'photo', tag: @$scope.arct
      .error (err) ->
        console.error err

