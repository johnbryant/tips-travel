angular.module 'tipstravel'

.config [
  '$locationProvider'
  '$urlRouterProvider'
  '$stateProvider'
  (
    $locationProvider
    $urlRouterProvider
    $stateProvider
  ) ->
    $locationProvider.html5Mode true

    $urlRouterProvider
    .otherwise '/404'

    $stateProvider
    .state 'abslogin'
    ,
      template: '<div ui-view></div>'
      abstract: true
#      resolve:
#        authorizationn: gResolveProvider.authorizationn

    .state 'portal'
    ,
      parent: 'abslogin'
      url: '/'
      templateUrl: '/modules/portal/index.html'
      controller: 'portalCtrl'

    .state 'login'
    ,
      parent: 'abslogin'
      url: '/login'
      templateUrl: '/modules/login/signin.html'
      controller: 'signinCtrl'
]