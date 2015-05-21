angular.module 'tipstravel'

.service 'Global', [
  () ->

    @baseUrl = 'http://172.24.171.4:8080/tipstravel'
    @userId = null
    @userName = null
]