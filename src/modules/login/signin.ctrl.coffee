angular.module 'tipstravel'

.classy.controller

  name: 'loginCtrl'

  inject: [
    '$scope'
    '$state'
    'apiUser'
    'Global'
    'AUTH'
  ]

  init: ->
    @$scope.hello = "follow and share the interesting travel pictures"
    @$scope.topactive = false
    @$scope.middleactive = false
    @$scope.bottomactive = false
    @$scope.isopened = false
    @$scope.onclose = true
    @$scope.onopen = false
#    @$scope.signup_errorInfo = 'haha'
#    console.log @AUTH.isLogged()

  methods:
    goSignup: ->
      @$state.go 'portal'

    signin: ->
      console.log @$scope.ema_id
      Promise.bind @
      .then ->
        @apiUser.login
          email: @$scope.email
          password: @$scope.password
      .then (result) ->
        if result.message is '密码不正确'
          @$scope.signup_errorInfo = 'invalid email or password! '
        else
          @Global.userId = result.user_id
          @AUTH.login @Global.userId
          @$state.go 'dashboard'
      .error (err) ->
        console.error err

    openlNav: ->

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