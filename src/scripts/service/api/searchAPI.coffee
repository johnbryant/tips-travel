angular.module 'tipstravel'

.factory 'apiSearchBase', [
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

.factory 'apiSearch', [
  'apiSearchBase'
  (apiSearchBase) ->
    search: (getInfo) ->
      {
        tag_name
        start_index
        user_id
      } = getInfo
      meta = apiSearchBase.one 'tag'
      .all 'search'
      console.log 'api'
      new Promise (resolve, reject) ->
        meta.post
          tagname:tag_name
          startindex:start_index
          userid:user_id
        .then (result) ->
          resolve  result
        , (res) ->
          reject res



]
