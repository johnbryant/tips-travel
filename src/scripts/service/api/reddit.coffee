angular.module 'tipstravel'

.factory 'Reddit', [
  'apiTips'
  (
    apiTips
    Global
  ) ->
    getApiFunction = (classify_name) ->
      switch classify_name
        when 'followingTips' then apiTips.getFollowingTips
        when 'myTips' then apiTips.getMyTips

    Reddit = (api_setting) ->
      @scope = api_setting.scope
      @items = []
      @busy = false
      @api_func = getApiFunction api_setting.classify_name
      @arg_start = api_setting.start if api_setting.start?
      @arg_count = api_setting.count if api_setting.count?
      @arg_user_id = api_setting.user_id if api_setting.user_id
      @busy_statu = 'Loading...'

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
        console.log result.data
        if _.isEmpty result.data
          @busy_statu = 'No more tips!'
          @scope.$apply()
          return

        for tip in result.data
          tip.like_return = {
            like_count: tip.like_count
            like_btn_url: if tip.isliked is "true" then 'styles/img/like_bkg.png' else 'styles/img/unlike_bkg.png'
          }
        console.log result.data
        @items =_.union @items, result.data
        @busy = false
        @arg_start += result.data.length
        @scope.$apply()
      .catch (err) ->
        console.error err


    Reddit

]


.factory 'TopicReddit', [
  'apiTopic'
  (
    apiTopic
  ) ->
    getApiFunction = (classify_name) ->
      switch classify_name
        when 'topicTips' then apiTopic.getTopicTips
        else apiTopic.getTopicTips

    TopicReddit = (topic_api_setting) ->
      @scope = topic_api_setting.scope
      @items = []
      @busy = false
      @api_func = getApiFunction topic_api_setting.classify_name
      @arg_start = topic_api_setting.start
      @arg_count = topic_api_setting.count if topic_api_setting.count?
      @arg_user_id = topic_api_setting.user_id if topic_api_setting.user_id
      @busy_statu = 'Loading...'

    TopicReddit::nextPage = ->
      if @busy
        return
      @busy = true

      Promise.bind @
      .then ->
        @api_func
          startindex: @arg_start
          topicid: "1"
          userid: @arg_user_id

      .then (result) ->

        if _.isEmpty result.data
          @busy_statu = 'No more tips!'
          @scope.$apply()
          return

        _i = 0
        _len = result.data.length
        while _i < _len
          if _i % 2 == 0
            result.data[_i].position = 'topic_right'
          else
            result.data[_i].position = 'topic_left'
          _i++

        for tip in result.data
          tip.like_return = {
            like_count: tip.like_count
            like_btn_url: if tip.isliked is "true" then 'styles/img/like_bkg.png' else 'styles/img/unlike_bkg.png'
          }
          console.log tip.isliked

        console.log result.data
        @items =_.union @items, result.data
        @busy = false
        @arg_start += result.data.length
        @scope.$apply()
      .catch (err) ->
        console.error err


    TopicReddit

]