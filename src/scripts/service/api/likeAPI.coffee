angular.module 'tipstravel'

.factory 'apiLikesBase', [
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

.factory 'apiLikes', [
  'apiLikesBase'
  (apiLikesBase) ->
    likeTips: (like_info) ->
      {
        message_id
        user_id
      } = like_info
      meta = apiLikesBase.one 'message'
      .all 'like'

      new Promise (resolve, reject) ->
        meta.post
          messageid: message_id
          userid: user_id
        .then (result) ->
          resolve result
        , (res) ->
          reject res
]