angular.module 'tipstravel'

.classy.controller

  name: 'signinCtrl'

  inject: [
    '$scope'
    'apiUser'
  ]

  init: ->
    @$scope.hello = "good!"

  methods:
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
