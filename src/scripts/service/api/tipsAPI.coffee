angular.module 'tipstravel'

.factory 'apiTipsBase', [
  'Restangular'
  (Restangular) ->
    baseURL = "http://172.24.171.2:8080/tipstravel"

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
        userID: userID
        index: 0
      .then (result) ->
        resolve result
      , (res) ->
        reject res












]