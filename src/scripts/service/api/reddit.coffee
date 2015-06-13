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
          tip.follow_btn_content = if tip.user.isfollowed is "true" then 'unfollow' else 'follow'
          tip.user.follow_btn_show = if tip.user.isfollowed is "itself" then false else true

        for photo in result.data
          photo.like_return = {
            like_btn_content : if photo.isliked is "true" then 'unlike' else 'like'
            like_count: photo.like_count
            like_btn_url: if photo.isliked is "true" then 'styles/img/like_bkg.png' else 'styles/img/unlike_bkg.png'
          }
          photo.follow_btn_content = if photo.user.isfollowed is "true" then 'unfollow' else 'follow'
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
      @arg_topic_id = topic_api_setting.topic_id
      @busy_statu = 'Loading...'

    TopicReddit::nextPage = ->
      if @busy
        return
      @busy = true

      Promise.bind @
      .then ->
        @api_func
          startindex: @arg_start
          topicid: @arg_topic_id
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
          tip.follow_return = {
            isfollowed: tip.user.isfollowed
            follow_btn_content: if tip.user.isfollowed is "true" then 'unfollow' else 'follow'
          }
        console.log result.data



        @items =_.union @items, result.data
        @busy = false
        @arg_start += result.data.length
        @scope.$apply()
      .catch (err) ->
        console.error err


    TopicReddit

]

.factory 'PhotoReddit', [
  'apiSearch'
  (
    apiSearch
    Global
  ) ->


    PhotoReddit = (photo_api_setting) ->
      @scope = photo_api_setting.scope
      @items = []
      @busy = false
      @arg_start =photo_api_setting.start
      @arg_count = photo_api_setting.count if photo_api_setting.count?
      @arg_user_id =photo_api_setting.user_id if photo_api_setting.user_id
      @arg_tag_name=photo_api_setting.tag_name
      @busy_statu = 'Loading...'
      @api_func=apiSearch.search
      console.log 'photoreddit'
      console.log @arg_start
      console.log @arg_tag_name

    PhotoReddit::nextPage = ->
      if @busy
        return
      @busy = true
      console.log @busy

      Promise.bind @
      .then ->
        @api_func
          start_index: @arg_start
          user_id: @arg_user_id
          tag_name:@arg_tag_name

      .then (result) ->
        console.log result.data
        if _.isEmpty result.data
          @busy_statu = 'No more tips!'
          @scope.$apply()
          console.log result.data.length
          return



        _len = result.data.length
        _n = 0
        while _n < _len
          if _n % 3 == 0
            result.data[_n].pos = 'left'
          else if _n % 3 == 1
            result.data[_n].pos = 'right'
          else
            result.data[_n].pos = 'mid'
          _n++

        for photo in result.data
          photo.like_return = {
            like_btn_content:if photo.isliked is "true" then 'unlike' else 'like'
            like_count: photo.like_count
            like_btn_url: if photo.isliked is "true" then 'styles/img/like_bkg.png' else 'styles/img/unlike_bkg.png'
          }
          photo.follow_return = {
            isfollowed: photo.user.isfollowed
            follow_btn_content: if photo.user.isfollowed is "true" then 'unfollow' else 'follow'
          }

#        console.log result.data


        @items =_.union @items, result.data
        @busy = false
        @arg_start += result.data.length
        @scope.$apply()
      .catch (err) ->
        console.error err

    PhotoReddit
]
