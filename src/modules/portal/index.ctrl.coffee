angular.module 'tipstravel'

.classy.controller

  name: 'portalCtrl'

  inject: [
    '$scope'
    '$state'
    'apiUser'
    'Global'
  ]

  init: ->
    @$scope.webname = 'IPicYou'
    @$scope.tips = "follow and share the interesting travel pictures"
    @$scope.topactive = false
    @$scope.middleactive = false
    @$scope.bottomactive = false
    @$scope.isopened = false
    @$scope.onclose = true
    @$scope.onopen = false
#    @$scope.errorInfo = 'good'

  methods:
  	openNav: ->
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

    goSignin: ->
      @$state.go 'login'

    goSearch: ->
      @$state.go 'search'

    signup: ->
#      console.log @$scope.Inusername
#      console.log @$scope.Inemail
#      console.log @$scope.Inpassword
      Promise.bind @
      .then ->
        @apiUser.register
          email: @$scope.Inemail
          username: @$scope.Inusername
          password: @$scope.Inpassword
      .then (result) ->
        console.log result
#        @$scope.errorInfo = if result.message is'ÓÊÏäÒÑ×¢²á' then 'The email has been registered!' else 'The username has been registered!'

        if result.message is 'ÓÊÏäÒÑ×¢²á'
          @$scope.errorInfo = 'The email has been registered!'
        else if result.message is 'ÓÃ»§ÃûÒÑ×¢²á'
          @$scope.errorInfo = 'The username has been registered!'
        else
          @$scope.errorInfo = null
          @Global.userId = result.user_id
          @Global.userName = result.username
          @$state.go 'recommendationBox'
      .error (err) ->
        console.error err