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
    # user login
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

    # user register
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

    # get the recommendation users list
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

    # set user's account
    SettingAccount: (account_data) ->
      {
        userid
        password
      } = account_data
      meta = apiUserBase.one 'user'
      .all 'updatepassword'

      new Promise (resolve, reject) ->
        meta.post
          user_id: userid
          password: password
        .then (result) ->
          resolve result
        , (res) ->
          reject res

    # set user's profile
    SettingProfile: (profile_data) ->
      {
        userid
        username
        usergender
        usercity
        userintroduction
      } = profile_data
      meta = apiUserBase.one 'user'
      .all 'updateprofile'

      new Promise (resolve, reject) ->
        meta.post
          user_id : userid
          username : username
          gender : usergender
          city : usercity
          introduction : userintroduction
        .then (result) ->
          resolve result
        , (res) ->
          reject res

    # recommendation follow users
    sendFollowUser: (user_data) ->
      {
        user_id
        all_follow_users
      } = user_data
      meta = apiUserBase.one 'user'
      .all 'nachrecommendation'

      new Promise (resolve, reject) ->
        meta.post
          userid: user_id
          allFollowUsers: all_follow_users
        .then (result) ->
          resolve result
        , (res) ->
          reject res

    # follow user in dashboard or topic or photo wall
    dealFollowUser: (user_data) ->
      {
        following_id
        user_id
      } = user_data
      meta = apiUserBase.one 'user'
      .all 'follow'

      new Promise (resolve, reject) ->
        meta.post
          followingid: following_id
          userid: user_id
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


