local sempaiFunctions = require('sempai.sempai_functions');
local tableFunctions = require('matrix.matrix_functions');
local cloneFunctions = require('utils.clone_functions');

local M = {};

local function calculateValue(n, m)
    return ((n + m) * (n + m - 1) / 2) + n - m
end

function M.warSempai(matrix, sempai, sempai2)
    local newMatrix = cloneFunctions.cloneMatrix(matrix);
    if sempai and sempai2 then
        if sempaiFunctions.sempaiTotalScore(sempai) > sempaiFunctions.sempaiTotalScore(sempai2) then
            newMatrix = tableFunctions.removeSempai(newMatrix, sempai2);
        elseif sempaiFunctions.sempaiTotalScore(sempai) < sempaiFunctions.sempaiTotalScore(sempai2) then
            newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
        else
            local valueCalculateS1 = calculateValue(sempai.x, sempai.y);
            local valueCalculateS2 = calculateValue(sempai2.x, sempai2.y);
            if valueCalculateS1 > valueCalculateS2 then
                newMatrix = tableFunctions.removeSempai(newMatrix, sempai2);
            else
                newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
            end
        end
    elseif sempai then
        newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
    elseif sempai2 then
        newMatrix = tableFunctions.removeSempai(newMatrix, sempai2);
    end
    return newMatrix;
end

return M;
