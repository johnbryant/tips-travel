angular.module 'tipstravel'

.provider 'authorization', ->
  resolve: [
    '$rootScope'
    '$state'
    '$timeout'
    'AUTH'
    'Global'
    (
      $rootScope
      $state
      $timeout
      AUTH
      Global
    ) ->
      unless AUTH.isLogged()
        if $rootScope.toState.data &&$rootScope.toState.data.role is 'User'
          $timeout ->
            $state.go 'login'
          , 0
        return

      Global.userId = AUTH.token()

      return
  ]

  $get: ->