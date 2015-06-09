angular.module 'tipstravel'

.classy.controller

  name: 'searchCtrl'

  inject: [
    '$scope'
    '$state'
    'apiSearch'
    'Global'
  ]


  init: ->
    @$scope.test = "Search"
    @$scope.errorInfo = null
    console.log 'good'

  methods:
    goTopic: (num) ->
      @$state.go 'topic', num:num

    searchFor:() ->
      console.log 'search'
      Promise.bind @
      .then ->
        @apiSearch.search
          tag_name: @$scope.tag_name
          start_index:0
          user_id:@Global.userId
          console.log @$scope.tag_name
      .then (result) ->
        console.log result
        if result.message is 'fail'
          @$scope.errorInfo = 'There is no such Tag!'
          console.log @$scope.errorInfo
        else
          @$scope.errorInfo = null
          @$state.go 'photo', tag:@$scope.tag_name
      .error (err) ->
        console.error err





