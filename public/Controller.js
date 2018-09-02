var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope,$http) {


	$scope.getProducts = function () {
		$http.get("/getProducts").then(
			function(response) {
				$scope.products = response.data.products;
			},
			function(error) {
				console.log(error);
			}
		);
	}

	$scope.loadCart = function () {
		$http.get("/getCart").then(
			function(response) {
				$scope.cart = response.data;
				$scope.cart.cartTotal = $scope.cart.totalItem = 0;
				for (var i = 0; i < $scope.cart.length; i++) {
					$scope.cart.cartTotal += $scope.cart[i].item_total;
					$scope.cart.totalItem += $scope.cart[i].quantity;
				}
			},
			function(error) {
				console.log(error);
			}
		);	
	}
	
	$scope.addProduct = function() {
		$http.post('/addProduct',$scope.product).then(
			function(response) {
				window.location.assign(response.data.redirect_to)
			},
			function(error) {
				console.log(error);
			}
		);
	}

	$scope.addItemToCart = function(item) {
		$scope.item = item;
		$http.post('/addToCart',$scope.item).then(
			function(response) {
				$scope.loadCart();
				alert("This item added to your cart.")
			},
			function(error) {
				console.log(error);
			}
		);
	}

	$scope.addProductPage = function() {
		window.location.assign("/add_product.html")
	}
	$scope.indexPage = function() {
		window.location.assign("/index.html")
	}
	$scope.cartPage = function() {
		window.location.assign("/cart.html")
	}
});