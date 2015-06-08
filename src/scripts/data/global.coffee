angular.module 'tipstravel'

.service 'Global', [
  () ->

    @baseUrl = 'http://192.168.191.1:8080/tipstravel'
    @userId = null
    @userName = null

  ]