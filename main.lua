local configuration = require('config.configuration');
local initProject = require('config.init_project_functions');
local gongFunctions = require('movement.gong_function');

-- ------------MAIN---------------
local matrix = initProject.initConfigurationProject(configuration);

matrix = gongFunctions.gong(matrix);
