angular.module 'tipstravel'

.factory 'apiTipsBase', [
  'Restangular'
  (Restangular) ->
    baseURL = "http://192.168.1.100:8080/tipstravel"

    Restangular.withConfig (RestangularConfigurer) ->
      RestangularConfigurer.setBaseUrl baseURL
]

.factory 'apiTips', [
  'apiTipsBase'
  (apiTipsBase) ->
    getTips: (getInfo) ->
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












]