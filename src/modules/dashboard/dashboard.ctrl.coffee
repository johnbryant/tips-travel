angular.module 'tipstravel'

.classy.controller

	name: 'dashboardCtrl'

	inject: [
		'$scope'
	]

	init: ->
		@$scope.tips = "follow and share the interesting travel tips"
		@$scope.topactive = false
		@$scope.middleactive = false
		@$scope.bottomactive = false
		@$scope.isopened = false
		@$scope.onclose = true
		@$scope.onopen = false

	methods:
  	opendNav: ->
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

