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
    search: (tips_data) ->
      {
       tagname
       startindex
      } =tips_data
      meta = apiSearchBase.one'tag'.all "search"



    new Promise (resolve, reject) ->
    meta.post
      tagname:tagname
      startindex:startindex
     .then (result) ->
      resolve  result
     , (res) ->
      reject res



]
