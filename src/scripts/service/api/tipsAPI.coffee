angular.module 'tipstravel'

.factory 'apiTipsBase', [
  'Restangular'
  'Global'
  (
    Restangular
    Global
  ) ->
    baseURL = Global.baseUrl
    Restangular.withConfig (RestangularConfigurer) ->
      RestangularConfigurer.setBaseUrl baseURL
]

.factory 'apiTips', [
  'apiTipsBase'
  (apiTipsBase) ->
    getFollowingTips: (getInfo) ->
      {
        userID
        index
      } = getInfo
      meta = apiTipsBase.one 'message'
      .all 'following'

      new Promise (resolve, reject) ->
        meta.post
          userid: userID
          startindex: index
        .then (result) ->
          resolve result
        , (res) ->
          reject res



    getMyTips: (getInfo) ->
      {
        userID
        index
      } = getInfo
      meta = apiTipsBase.one 'message'
      .all 'homepage'

      new Promise (resolve, reject) ->
        meta.post
          userid: userID
          startindex: index
        .then (result) ->
          resolve result
        , (res) ->
          reject res

    getUserTips: (getInfo) ->
      console.log "this is getUserTips"
      {
        visit_id
        user_id
        index
      } = getInfo
      meta = apiTipsBase.one 'message'
      .all 'homepage'

      new Promise (resolve, reject) ->
        meta.post
          visitid: visit_id
          userid: user_id
          startindex: index
        .then (result) ->
          resolve result
        , (res) ->
          reject res







]