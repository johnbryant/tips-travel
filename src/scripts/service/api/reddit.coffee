angular.module 'tipstravel'

.factory 'Reddit', [
  'apiTips'
  (
    apiTips
  ) ->
    getApiFunction = (classify_name) ->
      switch classify_name
        when 'followingTips' then apiTips.getFollowingTips

        else apiTips.getFollowingTips

    Reddit = (api_setting) ->
      @scope = api_setting.scope
      @items = []
      @busy = false
      @api_func = getApiFunction api_setting.classify_name
      @arg_start = api_setting.start if api_setting.start?
      @arg_count = api_setting.count if api_setting.count?
      @arg_user_id = api_setting.user_id if api_setting.user_id
      @busy_statu = '努力加载中...'

    Reddit::nextPage = ->
      if @busy
        return
      @busy = true

      Promise.bind @
      .then ->
        @api_func
          index: @arg_start
          userID: @arg_user_id

      .then (result) ->
        if _.isEmpty result.data
          @busy_statu = '没有更多Tips'
          @scope.$apply()
          return
        @items =_.union @items, result.data
        @busy = false
        @arg_start += result.data.length
        @scope.$apply()
      .catch (err) ->
        console.error err


    Reddit

]