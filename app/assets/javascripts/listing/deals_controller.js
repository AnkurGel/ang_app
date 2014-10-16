(function() {
  'use strict';

  angular.module('crmApp.listing')
  	.controller('TableController', ['$scope', function($scope) {
      $scope.deals = [
        { name: 'Microsoft', stage: 'New' },
        { name: 'GitHub', stage: 'Onboarding' }
      ];

      $scope.tableHeaders = {
      	name: 'Deal',
      	stage: 'Stage'
      }

    }])
})();
