angular.module 'tipstravel'

.classy.controller

  name: 'photoCtrl'

  inject: [
    '$scope'

  ]

  data:
   photo_api_setting:
        start: 0
        classify_name: null
        user_id: null
        scope: null
        tag_id:null


  init: ->
    @$scope.tips = "follow and share the interesting travel tips"
    @$scope.photo_reddit = new @PhotoReddit @photo_api_setting
    @$scope.baseUrl = @Global.baseUrl
