angular.module 'tipstravel'

.classy.controller

  name: 'dashboardCtrl'

  inject: [
    '$scope'
    'apiTips'
    'Global'
  ]

  data:
    getData: ->
      Promise.bind @
      .then ->
        @apiTips.getTips
          userID: 1
          index: 0
      .then (result) ->
        @$scope.tipsdata = result.data
        @$scope.$apply()
      .error (err) ->
        console.error err

  init: ->

    @$scope.BaseURL = @Global.baseUrl
    @$scope.tips = "follow and share the interesting travel tips"
    @$scope.topactive = false
    @$scope.middleactive = false
    @$scope.bottomactive = false
    @$scope.isopened = false
    @$scope.onclose = true
    @$scope.onopen = false
    @getData()



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
