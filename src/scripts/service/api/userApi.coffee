angular.module 'tipstravel'

.factory 'apiUserBase', [
  'Restangular'
  (Restangular) ->
    baseURL = "http://192.168.1.105:8080/tipstravel"

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

      a = JSON.stringify email: email, password: password


      new Promise (resolve, reject) ->
        meta.post a
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

#    register: (register_data) ->
#      {
#      cellphone
#      password
#      verification_code
#      promo
#      ticket
#      } = register_data
#      meta = apiUserBase.all 'register'
#      new Promise (resolve, reject) ->
#        meta.post
#          cellphone: cellphone
#          password: password
#          verification_code: verification_code
#          promo: promo
#          ticket: ticket
#        .then (result) ->
#          resolve result
#        , (res) ->
#          reject res

