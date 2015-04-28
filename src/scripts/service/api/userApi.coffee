angular.module 'tipstravel'

.factory 'apiUserBase', [
  'Restangular'
  (Restangular) ->
    baseURL = "http://192.168.1.110:8080/tipstravel"

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


