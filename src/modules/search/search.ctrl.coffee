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

    searchFor: ->
      console.log 'search'
      Promise.bind @
      .then ->
        @apiSearch.search
          tagname: @$scope.tagname
        console.log @$scope.tagname
      .then (result) ->
        console.log result

        if result.message is 'fail'
          @$scope.errorInfo = 'There is no such Tag!'
        else
          @$scope.errorInfo = null
          @$state.go 'photo'
      .error (err) ->
        console.error err

    searchTest: ->
      console.log 'tet'



