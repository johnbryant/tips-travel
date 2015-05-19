angular.module 'tipstravel'

.service 'AUTH', [
    '$cookies'
  (
    $cookies
  ) ->


    @_token = null
    @isLogged = ->
      try
        return @_token if @_token
        return !!$cookies.get 'user-id'
      catch e
        return false

    @token = ->
      return @_token if @_token
      $cookies.get 'user-id'

    @login = (token) ->
      d = new Date()
      d.setTime d.getTime() + 15*24*3600*1000
      @_token = token
      $cookies.put 'user-id', token

    @logout = ->
      @_token = null
      $cookies.remove 'user-id'

    @
]