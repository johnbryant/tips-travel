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
    @$scope.userid = 1
    @$scope.newpassword = null

    @$scope.pwd_err_info = false
    @$scope.pwd_success_info = false
    @$scope.pwd_info = null



  methods:
    saveAccount: ->
      Promise.bind @
      .then ->
        @apiUser.SettingAccount
          userid: @$scope.userid
          password: @$scope.Inpassword
      .then (result) ->
        console.log result
        if result.message is '�����ظ�'
          @$scope.pwd_err_info = true
          @$scope.pwd_success_info = false
          @$scope.pwd_info = 'the password is exist!'
        else if result.message is '���³ɹ�'
          @$scope.pwd_err_info = false
          @$scope.pwd_success_info = true
          @$scope.pwd_info = 'update successful!'


    saveProfile: ->
