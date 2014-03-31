angular.module('selectMultipleAppointmentTypesApp')
    .controller('selectMultipleAppointmentTypesController',['$scope', 'AppointmentService', 'filterFilter',
        function ($scope, AppointmentService, filterFilter) {
            $scope.allAppointmentTypes = [];
            $scope.selectedAppointmentTypes = [];
            $scope.openList = "none";
            $scope.showAllAppointmentTypesModal = false;

            // initialize allAppointmentTypes variable
            AppointmentService.getAppointmentTypes().then(function (result) {
                $scope.allAppointmentTypes = result;
            });


            $scope.addAppointmentType = function(appointmentType) {
                if(!isChecked(appointmentType)) {
                    $scope.selectedAppointmentTypes.push(appointmentType);
                    sendSelectedAppointmentTypesEvent();
                }
            }

            var isChecked = function (appointmentType) {
                var index = getOptionIndex(appointmentType);
                return (index === -1) ? false : true;
            };

            var getOptionIndex = function (appointmentType) {
                return $.inArray(appointmentType, $scope.selectedAppointmentTypes);
            };

            $scope.removeAppointmentType = function (appointmentTypeToRemove) {
                $scope.selectedAppointmentTypes.splice(getOptionIndex(appointmentTypeToRemove), 1);
                sendSelectedAppointmentTypesEvent();
            }

            $scope.getAppointmentTypes = function(searchString) {
                var filteredAppointmentTypes = filterFilter($scope.allAppointmentTypes, function(row) {
                    return row.display.toLowerCase().indexOf(searchString.toLowerCase()) != -1;
                });
                return filteredAppointmentTypes;
            }

            var sendSelectedAppointmentTypesEvent = function() {
                var eventData = {
                    senderd: $scope.senderId,
                    data : $scope.selectedAppointmentTypes
                };
                $scope.$emit('selectMultipleAppointmentTypesApp.selectionChanged', eventData);
            }
        }]);
