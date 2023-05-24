local tableFunctions = require('matrix.matrix_functions');
local movementFunctions = require('movement.movement_functions');
local cloneFunctions = require('utils.clone_functions');
local printFunctions = require('utils.print_functions');

local M = {};

local function isSingle(matrix)
    local elementList = {};
    for i = 1, #matrix do
        for j = 1, #matrix[i] do
            local element = matrix[i][j];
            if element ~= nil and element ~= "-" then
                table.insert(elementList, element);
            end
        end
    end

    if #elementList == 1 then
        return true;
    else
        return false;
    end
end

local function minPathToProperty(matrix, sempai)
    local x, y = sempai.x, sempai.y;
    --Calcolo la distanza Euclidea tra il Sempai e ogni proprietà.
    local distances = {};
    for i = 1, #matrix do
        for j = 1, #matrix[i] do
            local element = matrix[i][j];
            if element ~= nil and element ~= "-" and element ~= sempai and element.umilta == nil then
                local dist = math.sqrt((x - j) ^ 2 + (y - i) ^ 2);
                table.insert(distances, { x = j, y = i, distance = dist });
            end
        end
    end
    --Se ci sono ancora proprietà nella matrice:
    local nearest = nil;
    if #distances > 0 then
        --Ordina le proprietà in base alla distanza del Sempai:
        table.sort(distances, function(a, b) return a.distance < b.distance end);
        nearest = distances[1];
    end
    return nearest;
end

local function minPathToSempai(matrix, sempai)
    local x, y = sempai.x, sempai.y;
    --Calcolo la distanza Euclidea tra il Sempai e ogni proprietà.
    local distances = {};
    for i = 1, #matrix do
        for j = 1, #matrix[i] do
            local element = matrix[i][j];
            if element ~= nil and element ~= sempai and type(element) == "table" and element.umilta ~= nil then
                local dist = math.sqrt((x - j) ^ 2 + (y - i) ^ 2);
                table.insert(distances, { x = j, y = i, distance = dist });
            end
        end
    end
    --Se ci sono ancora proprietà nella matrice:
    local nearest = nil;
    if #distances > 0 then
        --Ordina le proprietà in base alla distanza del Sempai:
        table.sort(distances, function(a, b) return a.distance < b.distance end);
        nearest = distances[1];
    end
    return nearest;
end

local function moveToNearest(matrix, sempai, nearest)
    local newMatrix = cloneFunctions.cloneMatrix(matrix);
    if nearest.x > sempai.x then
        newMatrix = movementFunctions.moveRight(newMatrix, sempai);
    elseif nearest.x < sempai.x then
        newMatrix = movementFunctions.moveLeft(newMatrix, sempai);
    elseif nearest.y > sempai.y then
        newMatrix = movementFunctions.moveUp(newMatrix, sempai);
    elseif nearest.y < sempai.y then
        newMatrix = movementFunctions.moveDown(newMatrix, sempai);
    end
    return newMatrix;
end

function M.gong(matrix)
    local newMatrix = cloneFunctions.cloneMatrix(matrix);
    local sempaiList = tableFunctions.getSempaiList(matrix);

    while #sempaiList > 0 do
        for i = #sempaiList, 1, -1 do
            local s = sempaiList[i];

            local nearest = minPathToProperty(newMatrix, s);
            if nearest then
                newMatrix = moveToNearest(newMatrix, s, nearest);
                table.remove(sempaiList, i);
                printFunctions.printMatrix(newMatrix);
                break;
            else
                nearest = minPathToSempai(newMatrix, s);
                if nearest then
                    newMatrix = moveToNearest(newMatrix, s, nearest);
                    table.remove(sempaiList, i);
                    printFunctions.printMatrix(newMatrix);
                    break;
                end
            end

        end
    end
    if isSingle(newMatrix) == false then
        newMatrix = M.gong(newMatrix);
    end
    return newMatrix;
end

return M;

--[[

function M.gong(matrix)
    local newMatrix = cloneFunctions.cloneMatrix(matrix);
    local sempaiList = tableFunctions.getSempaiList(matrix);

    while #sempaiList > 0 do
        for i = #sempaiList, 1, -1 do
            local s = sempaiList[i];
            local nearest = minPathToProperty(newMatrix, s);
            if nearest then
                print('Sposto il sempai alla posizione: (' ..
                    s.x .. " , " .. s.y .. ") alla posizione : (" .. nearest.x .. " , " .. nearest.y .. ")");
                if nearest.x > s.x then
                    newMatrix = movementFunctions.moveRight(newMatrix, s);
                    printFunctions.printMatrix(newMatrix);
                elseif nearest.x < s.x then
                    newMatrix = movementFunctions.moveLeft(newMatrix, s);
                    printFunctions.printMatrix(newMatrix);
                elseif nearest.y > s.y then
                    newMatrix = movementFunctions.moveUp(newMatrix, s);
                    printFunctions.printMatrix(newMatrix);
                elseif nearest.y < s.y then
                    newMatrix = movementFunctions.moveDown(newMatrix, s);
                    printFunctions.printMatrix(newMatrix);
                end
                nearest = minPathToProperty(newMatrix, s);
                table.remove(sempaiList, i);
                break;
            else
                nearest = minPathToSempai(newMatrix, s);
                if nearest then
                    print('Sposto il sempai alla posizione: (' ..
                        s.x .. " , " .. s.y .. ") al Sempai : (" .. nearest.x .. " , " .. nearest.y .. ")");
                    if nearest.x > s.x then
                        newMatrix = movementFunctions.moveRight(newMatrix, s);
                        printFunctions.printMatrix(newMatrix);
                    elseif nearest.x < s.x then
                        newMatrix = movementFunctions.moveLeft(newMatrix, s);
                        printFunctions.printMatrix(newMatrix);
                    elseif nearest.y > s.y then
                        newMatrix = movementFunctions.moveUp(newMatrix, s);
                        printFunctions.printMatrix(newMatrix);
                    elseif nearest.y < s.y then
                        newMatrix = movementFunctions.moveDown(newMatrix, s);
                        printFunctions.printMatrix(newMatrix);
                    end
                    nearest = minPathToSempai(newMatrix, s);
                    table.remove(sempaiList, i);
                    break;
                end
            end
        end
    end
    if isSingle(newMatrix) == false then
        newMatrix = M.gong(newMatrix);
    end
    return newMatrix;
end
]]
