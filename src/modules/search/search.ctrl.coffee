angular.module 'tipstravel'

.classy.controller

  name: 'searchCtrl'

  inject: [
    '$scope'
    '$state'
    'apiSearch'
    'Global'
  ]
  data:
    search_api_setting:
     startindex: 0
     user_id: null

  init: ->
    @$scope.test = "Search"
    @$scope.errorInfo = null
    @search_api_setting.user_id = @Global.userId
    console.log 'good'

  methods:
    goTopic: (num) ->
      @$state.go 'topic', num:num

    searchFor: ->
      console.log 'search'
      Promise.bind @
      .then ->
        @apiSearch.search
          tagname: @$scope.tagname

      .then (result) ->
        console.log result

        if result.message is 'fail'
          @$scope.errorInfo = 'There is no such Tag!'
        else
          @$scope.errorInfo = null
          @$state.go 'photo'
      .error (err) ->
        console.error err





