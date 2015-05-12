angular.module 'tipstravel'

.factory 'apiTopicBase', [
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

.factory 'apiTopic', [
  'apiTopicBase'
  (apiTopicBase) ->
    getTopicTips: (getInfo) ->
      {
        userId
        topicId
      } = getInfo
      meta = apiTopicBase.one 'topic'
      .all 'search'

      new Promise (resolve, reject) ->
        meta.post
          userid: userId
          topicid: topicId
        .then (result) ->
          resolve result
        , (res) ->
          reject res

]