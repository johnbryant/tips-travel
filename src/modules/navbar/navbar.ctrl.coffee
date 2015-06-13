angular.module 'tipstravel'

.classy.controller

  name: 'navbarCtrl'

  inject: [
    '$scope'
    'Global'
    '$state'
    'AUTH'
  ]

  init: ->
    @$scope.hello = 'Hello world!'

  methods:
    goDashboard: ->
      @$state.go 'dashboard'

    goSearch: ->
      @$state.go 'photo'

    goTopic: ->
      @$state.go 'search'

    goExit: ->
      answer = confirm 'confirm exit?'
      if answer is true
        @AUTH.logout
        @$state.go 'login'
