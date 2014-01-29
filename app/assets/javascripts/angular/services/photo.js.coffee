angular.module('photoServices', [])
.factory 'Photo', ($resource) ->
  $resource '/admin/photos/:id/:action', { id: '@id' },
    fetchImageUrl: { method: 'GET', params: { action: 'image' }}