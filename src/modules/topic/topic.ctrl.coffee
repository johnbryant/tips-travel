angular.module 'tipstravel'

.classy.controller

  name: 'topicCtrl'

  inject: [
    '$scope'
    'apiTips'
    'Global'
  ]

  init: ->
    @$scope.hello = 'This is topic!'
    @$scope.name = 'Michael Corleone'
    @$scope.text = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod'

  methods: ->
