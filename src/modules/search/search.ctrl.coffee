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
    api_setting:
      start: 0

  init: ->
    @$scope.tips = "follow and share the interesting travel tips"
    @$scope.errorInfo = null

  method:
    goTopic: (num) ->
      @$state.go 'topic', num:num

    search: ->

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



