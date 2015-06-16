angular.module 'tipstravel'

.service 'Global', [
  () ->
    @baseUrl = 'http://192.168.1.109:8080/tipstravel'
    @userId = null
    @userName = null
  ]
