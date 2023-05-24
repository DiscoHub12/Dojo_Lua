local sempaiFunctions = require('sempai.sempai_functions');
local tableFunctions = require('matrix.matrix_functions');
local cloneFunctions = require('utils.clone_functions');
local printFunctions = require('utils.print_functions');

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

function M.warSempai2(matrix, sempai, sempai2)
    local newMatrix = cloneFunctions.cloneMatrix(matrix);
    local newSempai1 = cloneFunctions.cloneSempai(sempai);
    local newSempai2 = cloneFunctions.cloneSempai(sempai2);
    print('FUORI :');
    print('Sempai 1 : ');
    printFunctions.printSempai(newSempai1);
    print('Sempai 2');
    printFunctions.printSempai(newSempai2);
    if newSempai1 and newSempai2 then
        newSempai1, newSempai2 = M.increaseQuality(newSempai1, newSempai2);
        print('FUORI :');
        print('Sempai 1 : ');
        printFunctions.printSempai(newSempai1);
        print('Sempai 2');
        printFunctions.printSempai(newSempai2);
        if sempaiFunctions.sempaiTotalScore(newSempai1) > sempaiFunctions.sempaiTotalScore(newSempai2) then
            newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
            newMatrix = tableFunctions.insertSempai(newMatrix, newSempai1, sempai.x, sempai.y);
            newMatrix = tableFunctions.removeSempai(newMatrix, sempai2);
            print('Vince Sempai 1');
        elseif sempaiFunctions.sempaiTotalScore(newSempai1) < sempaiFunctions.sempaiTotalScore(newSempai2) then
            newMatrix = tableFunctions.removeSempai(newMatrix, sempai2);
            newMatrix = tableFunctions.insertSempai(newMatrix, newSempai2, sempai2.x, sempai2.y);
            newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
            print('Vince Sempai 2');
        else
            local valueCalculateS1 = calculateValue(newSempai1.x, newSempai1.y);
            local valueCalculateS2 = calculateValue(newSempai2.x, newSempai2.y);
            if valueCalculateS1 > valueCalculateS2 then
                print('Vince Sempai 1');
                newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
                newMatrix = tableFunctions.insertSempai(newMatrix, newSempai1, sempai.x, sempai.y);
                newMatrix = tableFunctions.removeSempai(newMatrix, sempai2);
            else
                newMatrix = tableFunctions.removeSempai(newMatrix, sempai2);
                newMatrix = tableFunctions.insertSempai(newMatrix, newSempai2, sempai2.x, sempai2.y);
                newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
                print('Vnice Sempai 2');
            end
        end
    elseif newSempai1 then
        newMatrix = tableFunctions.removeSempai(newMatrix, sempai);
    elseif newSempai2 then
        newMatrix = tableFunctions.removeSempai(newMatrix, sempai2);
    end
    return newMatrix;
end

function M.increaseQuality(sempai, sempai2)
    local newSempai1 = cloneFunctions.cloneSempai(sempai);
    local newSempai2 = cloneFunctions.cloneSempai(sempai2);

    if newSempai1 and newSempai2 then
        --Confronto Umiltà ed incremento.
        if newSempai1.umilta > newSempai2.umilta then
            newSempai1 = sempaiFunctions.increaseProperty(newSempai1, 'U');
        elseif newSempai1.umilta < newSempai2.umilta then
            newSempai2 = sempaiFunctions.increaseProperty(newSempai2, 'U');
        end

        --Confronto Coraggio ed incremento.
        if newSempai1.coraggio > newSempai2.coraggio then
            newSempai1 = sempaiFunctions.increaseProperty(newSempai1, 'C');
        elseif newSempai1.coraggio < newSempai2.coraggio then
            newSempai2 = sempaiFunctions.increaseProperty(newSempai2, 'C');
        end

        --Confronto Gentilezza ed incremento.
        if newSempai1.gentilezza > newSempai2.gentilezza then
            newSempai1 = sempaiFunctions.increaseProperty(newSempai1, 'G');
        elseif newSempai1.gentilezza < newSempai2.gentilezza then
            newSempai2 = sempaiFunctions.increaseProperty(newSempai2, 'G');
        end

        --Confronto Rispetto ed incremento.
        if newSempai1.rispetto > newSempai2.rispetto then
            newSempai1 = sempaiFunctions.increaseProperty(newSempai1, 'R');
        elseif newSempai1.rispetto < newSempai2.rispetto then
            newSempai2 = sempaiFunctions.increaseProperty(newSempai2, 'R');
        end
    end

    return newSempai1, newSempai2;
end

return M;
