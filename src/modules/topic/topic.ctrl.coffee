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

  methods: ->
