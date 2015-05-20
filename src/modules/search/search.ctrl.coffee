angular.module 'tipstravel'

.classy.controller

  name: 'searchCtrl'

  inject: [
    '$scope'
    '$state'
  ]

  init: ->
    @$scope.tips = "follow and share the interesting travel tips"

  method:
    goTopic: (num) ->
      @$state.go 'topic', num:num
