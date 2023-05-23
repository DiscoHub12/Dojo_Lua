local tableFunctions = require('matrix.matrix_functions');
local sempaiFunctions = require('sempai.sempai_functions');
local cloneFunctions = require('utils.clone_functions');

local M = {};

--[[
    Funzione che permette di creare una matrice
    con una data configurazione. Se la configurazione (o
    i dati al suo interno sono nulli) è nulla, o la dimensione
    della matrice è minore di 10 ritorna nil.
]]
function M.initConfigurationProject(configuration)
    if configuration == nil or configuration.N < 10 or configuration.D == nil then
        return nil
    end
    
    local matrix = tableFunctions.createMatrix(configuration.N)
    for letter, coordinates in pairs(configuration.D) do
        if letter == "S" then
            for _, coord in ipairs(coordinates) do
                local sempai = sempaiFunctions.createSempai(coord[1], coord[2])
                matrix = tableFunctions.insertSempai(matrix, sempai, coord[1], coord[2])
            end
        else
            for _, coord in ipairs(coordinates) do
                matrix = tableFunctions.insertElement(matrix, letter, coord[1], coord[2])
            end
        end
    end
    return matrix
end

return M;
