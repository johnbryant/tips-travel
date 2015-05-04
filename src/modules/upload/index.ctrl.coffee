angular.module 'tipstravel'

.controller 'uploadCtrl', [
    '$scope'
    'Upload'
    ($scope, Upload) ->
      $scope.$watch 'files', ->
        $scope.upload $scope.files
        return
      $scope.log = ''

      $scope.upload = (files) ->
        if files and files.length
          for file in files
            Upload.upload
              url: 'https://angular-file-upload-cors-srv.appspot.com/upload'
              fields: 'username': $scope.username
              file: file
            .progress (evt) ->
              progressPercentage = parseInt(100.0 * evt.loaded / evt.total)
              $scope.log = 'progress: ' + progressPercentage + '% ' +
              evt.config.file.name + '\n' + $scope.log
            .success (data, status, headers, config) ->
              $scope.log = 'file ' + config.file.name + 'uploaded. Response: ' +
              JSON.stringify(data) + '\n' + $scope.log
#              $scope.$apply()
          return

      return
  ]

