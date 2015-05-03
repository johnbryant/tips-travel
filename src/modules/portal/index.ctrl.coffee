angular.module 'tipstravel'

.classy.controller

  name: 'portalCtrl'

  inject: [
    '$scope'
    '$state'
    'apiUser'
  ]

  init: ->
    @$scope.tips = "follow and share the interesting travel tips"
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
      console.log @$scope.username
      Promise.bind @
      .then ->
        @apiUser.register
          email: @$scope.email
          username: @$scope.username
          password: @$scope.password
      .then (result) ->
        console.log result
      .error (err) ->
          console.error err
      if result.message is 'ÓÊÏäÒÑ¾­×¢²á'
        @$scope.errorInfo = 'The email has been registered!'
      else
        @$state.go 'login'