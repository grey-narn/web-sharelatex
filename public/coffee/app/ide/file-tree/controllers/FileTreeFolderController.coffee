define [
	"base"
], (App) ->
	App.controller "FileTreeFolderController", ["$scope", "ide", ($scope, ide) ->
		$scope.expanded = false

		$scope.toggleExpanded = () ->
			$scope.expanded = !$scope.expanded

		$scope.onDrop = (events, ui) ->
			source = $(ui.draggable).scope().entity
			ide.fileTreeManager.moveEntity(source, $scope.entity)

		$scope.orderByFoldersFirst = (entity) ->
			# We need this here as well as in FileTreeController
			# since the file-entity diretive creates a new scope
			# that doesn't inherit from previous scopes.
			return '0' if entity.type == "folder"
			return '1'
	]
