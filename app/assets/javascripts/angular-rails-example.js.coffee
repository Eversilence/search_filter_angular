#= require templates/products/index
#= require controllers/products-controller

app = angular.module 'angular-rails-example', ['ngRoute', 'productsController', 'templates', 'restangular']

app.config ['$routeProvider', '$locationProvider', '$httpProvider',
  ($routeProvider, $locationProvider, $httpProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'products/index.html'
        controller : 'ProductsController'
      .otherwise
        redirectTo: '/'
    $locationProvider.html5Mode true
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
