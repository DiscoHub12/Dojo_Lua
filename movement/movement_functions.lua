local tableFunctions = require('matrix.matrix_functions');
local sempaiFunctions = require('sempai.sempai_functions');
local cloneFunctions = require('utils.clone_functions');
local clashFunctions = require('war.clash_sempai_functions');

local M = {};

function M.moveUp(matrix, sempai)
    local newMatrix = cloneFunctions.cloneMatrix(matrix);
    local newSempai = cloneFunctions.cloneSempai(sempai);
    if tableFunctions.checkPosition(newMatrix, newSempai.x, newSempai.y + 1) then
        if tableFunctions.isEmptyInMatrix(newMatrix, newSempai.x, newSempai.y + 1) then
            newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
            newSempai.y = newSempai.y + 1;
            newMatrix = tableFunctions.insertSempai(newMatrix, newSempai, newSempai.x, newSempai.y);
        else
            local element = newMatrix[newSempai.y + 1][newSempai.x];
            if element ~= "-" and element ~= table and element.umilta == nil then
                newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
                newSempai.y = newSempai.y + 1;
                newSempai = sempaiFunctions.increaseProperty(newSempai, element);
                newMatrix = tableFunctions.removeElement(newMatrix, element, newSempai.x, newSempai.y);
                newMatrix = tableFunctions.insertSempai(newMatrix, newSempai, newSempai.x, newSempai.y);
            else
                newMatrix = clashFunctions.warSempai(newMatrix, newSempai, element);
            end
        end
    end
    return newMatrix;
end

function M.moveDown(matrix, sempai)
    local newMatrix = cloneFunctions.cloneMatrix(matrix);
    local newSempai = cloneFunctions.cloneSempai(sempai);
    if tableFunctions.checkPosition(newMatrix, newSempai.x, newSempai.y - 1) then
        if tableFunctions.isEmptyInMatrix(newMatrix, newSempai.x, newSempai.y - 1) then
            newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
            newSempai.y = newSempai.y - 1;
            newMatrix = tableFunctions.insertSempai(newMatrix, newSempai, newSempai.x, newSempai.y);
        else
            local element = newMatrix[newSempai.y - 1][newSempai.x];
            if element ~= "-" and element ~= table and element.umilta == nil then
                newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
                newSempai.y = newSempai.y - 1;
                newSempai = sempaiFunctions.increaseProperty(newSempai, element);
                newMatrix = tableFunctions.removeElement(newMatrix, element, newSempai.x, newSempai.y);
                newMatrix = tableFunctions.insertSempai(newMatrix, newSempai, newSempai.x, newSempai.y);
            else
                newMatrix = clashFunctions.warSempai(newMatrix, newSempai, element);
            end
        end
    end
    return newMatrix;
end

function M.moveLeft(matrix, sempai)
    local newMatrix = cloneFunctions.cloneMatrix(matrix);
    local newSempai = cloneFunctions.cloneSempai(sempai);
    if tableFunctions.checkPosition(newMatrix, newSempai.x - 1, newSempai.y) then
        if tableFunctions.isEmptyInMatrix(newMatrix, newSempai.x - 1, newSempai.y) then
            newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
            newSempai.x = newSempai.x - 1;
            newMatrix = tableFunctions.insertSempai(newMatrix, newSempai, newSempai.x, newSempai.y);
        else
            local element = newMatrix[newSempai.y][newSempai.x - 1];
            if element ~= "-" and element ~= table and element.umilta == nil then
                newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
                newSempai.x = newSempai.x - 1;
                newSempai = sempaiFunctions.increaseProperty(newSempai, element);
                newMatrix = tableFunctions.removeElement(newMatrix, element, newSempai.x, newSempai.y);
                newMatrix = tableFunctions.insertSempai(newMatrix, newSempai, newSempai.x, newSempai.y);
            else
                newMatrix = clashFunctions.warSempai(newMatrix, newSempai, element);
            end
        end
    end
    return newMatrix;
end

function M.moveRight(matrix, sempai)
    local newMatrix = cloneFunctions.cloneMatrix(matrix);
    local newSempai = cloneFunctions.cloneSempai(sempai);
    if tableFunctions.checkPosition(newMatrix, newSempai.x + 1, newSempai.y) then
        if tableFunctions.isEmptyInMatrix(newMatrix, newSempai.x + 1, newSempai.y) then
            newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
            newSempai.x = newSempai.x + 1;
            newMatrix = tableFunctions.insertSempai(newMatrix, newSempai, newSempai.x, newSempai.y);
        else
            local element = newMatrix[newSempai.y][newSempai.x + 1];
            if element ~= "-" and element ~= table and element.umilta == nil then
                newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
                newSempai.x = newSempai.x + 1;
                newSempai = sempaiFunctions.increaseProperty(newSempai, element);
                newMatrix = tableFunctions.removeElement(newMatrix, element, newSempai.x, newSempai.y);
                newMatrix = tableFunctions.insertSempai(newMatrix, newSempai, newSempai.x, newSempai.y);
            else
                newMatrix = clashFunctions.warSempai(newMatrix, newSempai, element);
            end
        end
    end
    return newMatrix;
end

return M;
