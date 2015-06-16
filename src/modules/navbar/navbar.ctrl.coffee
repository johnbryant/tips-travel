angular.module 'tipstravel'

.classy.controller

  name: 'navbarCtrl'

  inject: [
    '$scope'
    'Global'
    '$state'
    'AUTH'
    'apiSearch'
  ]

  init: ->
    @$scope.hello = 'Hello world!'

  methods:
    goDashboard: ->
      @$state.go 'dashboard'

    goSearch: ->
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


    goTopic: ->
      @$state.go 'search'

    goExit: ->
      answer = confirm 'confirm exit?'
      if answer is true
        @AUTH.logout
        @$state.go 'login'
