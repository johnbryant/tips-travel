angular.module 'tipstravel'

.classy.controller

  name: 'loginCtrl'

  inject: [
    '$scope'
    '$state'
    'apiUser'
  ]

  init: ->
    @$scope.hello = "follow and share the interesting travel tips"
    @$scope.topactive = false
    @$scope.middleactive = false
    @$scope.bottomactive = false
    @$scope.isopened = false
    @$scope.onclose = true
    @$scope.onopen = false

  methods:
    goSignup: ->
      @$state.go 'portal'

    signin: ->
      console.log @$scope.email
      Promise.bind @
      .then ->
        @apiUser.login
          email: @$scope.email
          password: @$scope.password
      .then (result) ->
        console.log result
      .error (err) ->
        console.error err

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