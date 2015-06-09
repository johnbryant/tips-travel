angular.module 'tipstravel'

.classy.controller

  name: 'searchCtrl'

  inject: [
    '$scope'
    '$state'
    'apiSearch'
    'Global'
  ]
<<<<<<< HEAD
  data:
    search_api_setting:
      startindex: 0
      user_id: null
=======

>>>>>>> origin/master

  init: ->
    @$scope.test = "Search"
    @$scope.errorInfo = null
    console.log 'good'

  methods:
    goTopic: (num) ->
      @$state.go 'topic', num:num

    searchFor:(tag) ->
      console.log 'search'
      Promise.bind @
      .then ->
        @apiSearch.search
<<<<<<< HEAD
          tagname: @$scope.tagname
          user_id: @Global.userId
          index: 0

=======
          tag_name: @$scope.tag_name
          start_index:0
          user_id:@Global.userId
          console.log @$scope.tag_name
>>>>>>> origin/master
      .then (result) ->
        console.log result
        if result.message is 'fail'
          @$scope.errorInfo = 'There is no such Tag!'
          console.log @$scope.errorInfo
        else
          @$scope.errorInfo = null
          @$state.go 'photo', tag:tag
      .error (err) ->
        console.error err





