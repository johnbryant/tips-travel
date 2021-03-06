angular.module 'tipstravel'

.config [
  '$locationProvider'
  '$urlRouterProvider'
  '$stateProvider'
  'gResolveProvider'
  (
    $locationProvider
    $urlRouterProvider
    $stateProvider
    gResolveProvider
  ) ->
    $locationProvider.html5Mode true

    $urlRouterProvider
    .otherwise '/404'

    $stateProvider

    .state 'abslogin'
    ,
      template: '<div ui-view></div>'
      abstract: true
      resolve:
        authorization: gResolveProvider.authorization

    .state 'portal'
    ,
      parent: 'abslogin'
      url: '/'
      templateUrl: '/modules/portal/index.html'
      controller: 'portalCtrl'
      data:
        role: 'Guest'

    .state 'login'
    ,
      parent: 'abslogin'
      url: '/login'
      templateUrl: '/modules/login/signin.html'
      controller: 'loginCtrl'
      data:
        role: 'Guest'

    .state 'search'
    ,
      parent: 'abslogin'
      url: '/search'
      templateUrl: '/modules/search/search.html'
      controller: 'searchCtrl'
      data:
        role: 'User'

    .state 'dashboard'
    ,
      parent: 'abslogin'
      url: '/dashboard'
      templateUrl: '/modules/dashboard/dashboard.html'
      controller: 'dashboardCtrl'
      data:
        role: 'User'

    .state 'personPage'
    ,
      parent: 'abslogin'
      url: '/personPage'
      templateUrl: '/modules/personPage/personPage.html'
      controller: 'personPageCtrl'
      data:
        role: 'User'

    .state 'userPage'
    ,
      parent: 'abslogin'
      url: '/userPage/:visit_id'
      templateUrl: '/modules/userPage/userPage.html'
      controller: 'userPageCtrl'
      data:
        role: 'User'

    .state 'topic'
    ,
      parent: 'abslogin'
      url: '/topic/:num'
      templateUrl: '/modules/topic/topic.html'
      controller: 'topicCtrl'
      data:
        role: 'User'

    .state 'photo'
    ,
      parent: 'abslogin'
      url: '/photo/:tag'
      templateUrl: '/modules/photo/photo.html'
      controller: 'photoCtrl'
      data:
        role: 'User'

    .state 'recommendationBox'
    ,
      parent: 'abslogin'
      url: '/recommendationBox'
      templateUrl: '/modules/recommendationBox/recommendationBox.html'
      controller: 'recommendationBoxCtrl'
      data:
        role: 'User'

    .state 'navbar'
    ,
      parent: 'abslogin'
      url: '/navbar'
      templateUrl: '/modules/navbar/navbar.html'
      controller: 'navbarCtrl'
      data:
        role: 'Guest'

    .state 'nav_side'
    ,
      parent: 'abslogin'
      url: '/nav_side'
      templateUrl: '/modules/nav_side/nav_side.html'
      controller: 'nav_sideCtrl'
      data:
        role: 'Guest'

    .state 'personSetting'
    ,
      parent: 'abslogin'
      url: '/personSetting'
      templateUrl: '/modules/personSetting/personSetting.html'
      controller: 'personSettingCtrl'
      data:
        role: 'User'
]