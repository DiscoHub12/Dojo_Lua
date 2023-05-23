local configuration = require('config.configuration');
local initProject = require('config.init_project_functions');
local tableFunctions = require('matrix.matrix_functions');
local movementFunctions = require('movement.movement_functions');
local gongFunctions = require('movement.gong_function');
local printFunctions = require('utils.print_functions');

-- ------------MAIN---------------
local matrix = initProject.initConfigurationProject(configuration);

matrix = gongFunctions.gong(matrix);
