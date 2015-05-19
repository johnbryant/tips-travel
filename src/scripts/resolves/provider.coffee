angular.module 'tipstravel'

.provider 'gResolve', [
  'authorizationProvider'
  (
    authorizationProvider
  ) ->
    authorization: authorizationProvider.resolve

    $get: ->
]
