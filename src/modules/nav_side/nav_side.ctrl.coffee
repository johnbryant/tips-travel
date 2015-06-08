angular.module 'tipstravel'

.classy.controller

  name: 'nav_sideCtrl'

  inject: [
    '$scope'
    '$state'
  ]

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

    goSignup: ->
      @$state.go 'portal'

    goSearch: ->
      @$state.go 'search'