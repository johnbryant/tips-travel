angular.module 'tipstravel'

.factory 'apiUserBase', [
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

.factory 'apiUser', [
  'apiUserBase'
  (apiUserBase) ->
    login: (login_data) ->
      {
      email
      password
      } = login_data
      meta = apiUserBase.all "login"

#      a = JSON.stringify email: email, password: password

      new Promise (resolve, reject) ->
        meta.post
          email: email
          password: password
        .then (result) ->
          resolve result
        , (res) ->
          reject res

    register: (register_data) ->
      {
      email
      password
      username
      } = register_data
      meta = apiUserBase.one 'user'
      .all 'add'

      new Promise (resolve, reject) ->
        meta.post
          email: email
          username: username
          password: password
        .then (result) ->
          resolve result
        , (res) ->
          reject res


    FirstUserFollow: (test_data) ->
      {
        user_id
      } = test_data
      meta = apiUserBase.one 'user'
      .all 'recommendation'

      new Promise (resolve, reject) ->
        meta.post
          userid : user_id
        .then (result) ->
          resolve result
        , (res) ->
          reject res


]







#    registerCheck: (register_check_data) ->
#      {
#      cellphone
#      } = register_check_data
#      meta = apiUserBase.one 'check_register'
#      new Promise (resolve, reject) ->
#        meta.get
#          cellphone: cellphone
#        .then (result) ->
#          resolve result
#        , (res) ->
#          reject res


