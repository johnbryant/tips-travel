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
        userid
        topicid
        startindex
      } = getInfo
      meta = apiTopicBase.one 'topic'
      .all 'search'

      new Promise (resolve, reject) ->
        meta.post
          userid: userid
          topicid: topicid
          startindex: startindex
        .then (result) ->
          resolve result
        , (res) ->
          reject res

]