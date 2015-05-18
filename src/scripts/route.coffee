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
      controller: 'loginCtrl'

    .state 'search'
    ,
      parent: 'abslogin'
      url: '/search'
      templateUrl: '/modules/search/search.html'
      controller: 'searchCtrl'

    .state 'dashboard'
    ,
      parent: 'abslogin'
      url: '/dashboard'
      templateUrl: '/modules/dashboard/dashboard.html'
      controller: 'dashboardCtrl'

    .state 'personPage'
    ,
      parent: 'abslogin'
      url: '/personPage'
      templateUrl: '/modules/personPage/personPage.html'
      controller: 'personPageCtrl'

    .state 'topic'
    ,
      parent: 'abslogin'
      url: '/topic'
      templateUrl: '/modules/topic/topic.html'
      controller: 'topicCtrl'


    .state 'recommendationBox'
    ,
      parent: 'abslogin'
      url: '/recommendationBox'
      templateUrl: '/modules/recommendationBox/recommendationBox.html'
      controller: 'recommendationBoxCtrl'

    .state 'navbar'
    ,
      parent: 'abslogin'
      url: '/navbar'
      templateUrl: '/modules/navbar/navbar.html'
      controller: 'navbarCtrl'


]