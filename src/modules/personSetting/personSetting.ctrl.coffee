angular.module 'tipstravel'

.classy.controller

  name: 'personSettingCtrl'

  inject: [
    '$scope'
    '$state'
    'Global'
    'apiUser'
  ]

  init: ->
    @$scope.hello = 'User Setting'
    @$scope.userid = @Global.userId
#    @$scope.
    @$scope.newpassword = null
    @$scope.username = null
    @$scope.pwd_err_info = false
    @$scope.pwd_success_info = false
    @$scope.pwd_info = null
    @$scope.profile_success_info = false
    @$scope.profile_info = null


  methods:
    saveAccount: ->
      Promise.bind @
      .then ->
        @apiUser.SettingAccount
          userid: @$scope.userid
          password: @$scope.Inpassword
      .then (result) ->
        console.log result
        if result is 'fail'
          console.log 'red fail'
          @$scope.pwd_err_info = true
          @$scope.pwd_success_info = false
          @$scope.pwd_info = 'the password is exist!'
        else if result is 'success'
          console.log 'green success'
          @$scope.pwd_err_info = false
          @$scope.pwd_success_info = true
          @$scope.pwd_info = 'update password successful!'
        else
          console.log 'else'
      .error (err) ->
        console.log err

    saveProfile: ->
      Promise.bind @
      .then ->
        @apiUser.SettingProfile
          userid: @Global.userId
          username: @$scope.Inusername
          usergender: @$scope.Ingender
          usercity: @$scope.Incity
          userintroduction: @$scope.Inintro
      .then (result) ->
        console.log result
        if result is 'success'
          @$scope.profile_success_info = true
          @$scope.profile_info = 'update profile successful!'
        else
          console.log 'else'
      .error (err) ->
        console.log err
