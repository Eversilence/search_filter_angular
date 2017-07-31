app = angular.module 'productsController', ['restangular']

app.controller 'ProductsController', ['$scope', 'Restangular',
  ($scope, Restangular) ->
    $scope.propertyHash = {}

    getPropertyTypes = ->
      Restangular.all('api/properties').getList().then (properties) ->
        $scope.properties = properties.plain()

    getProducts = ->
      Restangular.all('api/products').getList().then (products) ->
        $scope.products = products

    $scope.selectProperty = (property, propertyValue) ->
      $scope.propertyHash[property] = {} if _.isUndefined($scope.propertyHash[property])

      if _.contains($scope.propertyHash[property], propertyValue)
        $scope.propertyHash[property] = _.omit($scope.propertyHash[property], propertyValue)
      else
        $scope.propertyHash[property][propertyValue] = propertyValue

      clearParamsIfNeed()

      searchFilteredProducts($scope.propertyHash)

    $scope.startFilterRange = ->
      clearParamsIfNeed()
      searchFilteredProducts($scope.propertyHash)

    searchFilteredProducts = (params) ->
      Restangular.all('api/products/search').getList(filter: params).then (products) ->
        $scope.products = products

    $scope.resetFilters = ->
      $(':input[type="number"]').val('')
      $('input:checkbox').attr("checked" , false)
      $scope.propertyHash = {}
      getProducts()

    clearParamsIfNeed = ->
      _.each($scope.propertyHash, (hash, property) ->
        if _.isEmpty(hash) || (_.isNull(hash.min) || _.isNull(hash.max))
          $scope.propertyHash = _.omit($scope.propertyHash, property)
      )

    getPropertyTypes()
    getProducts()
]
