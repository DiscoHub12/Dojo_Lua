local cloneFunctions = require('utils.clone_functions');
local M = {};

--[[
    Funzione che permette di creare una matrice (scacchiera)
    2D di dimensioni N. Se la dimensione della matrice è minore
    di 4, ritorna nil.
]]
function M.createMatrix(n)
    if n < 4 then
        return nil;
    end
    local matrix = {};
    for i = 1, n do
        matrix[i] = {}
        for j = 1, n do
            matrix[i][j] = "-"
        end
    end
    return matrix
end

--[[
    Funzione che permette di controllare se una determinata
    posizione (coordinata x ed y) è all'interno della matrice.
]]
function M.checkPosition(matrix, x, y)
    if matrix[y] == nil or matrix[y][x] == nil then
        return false;
    end
    return true;
end

--[[
    Funzione che permette di controllare se una determinata
    posizione (coordinata x ed y della matrice) è libera, quindi
    non ci sono elementi o Sempai.
]]
function M.isEmptyInMatrix(matrix, x, y)
    if matrix[y][x] == "-" then
        return true;
    end
    return false;
end

--[[
    Funzione che permette l'inserimento di un
    elemento (proprietà) all'interno della matrice
    in una specifica posizione x ed y.
    Se l'inserimento è possibile, torna la nuova matrice,
    altrimenti torna comunque una nuova matrice, ma con le
    stesse caratteristiche della matrice presa in considerazione.
]]
function M.insertElement(matrix, letter, x, y)
    local updatedMatrix = cloneFunctions.cloneMatrix(matrix);
    if M.checkPosition(updatedMatrix, x, y) then
        if M.isEmptyInMatrix(updatedMatrix, x, y) then
            updatedMatrix[y][x] = letter;
        end
    end
    return updatedMatrix;
end

--[[
    Funzione che permette di rimuovere un determinato
    elemento (proprietà) all'interno della matrice, qualora
    esista e sia possibile.
    Se la rimozione è stata avvenuta con successo, torna una nuova
    matrice con le modifiche effettuate, altrimenti torna comunque una nnuova
    matrice ma con le stesse caratteristiche della matrice presa in
    considerazione.
]]
function M.removeElement(matrix, letter, x, y)
    local updatedMatrix = cloneFunctions.cloneMatrix(matrix);
    if M.checkPosition(updatedMatrix, x, y) then
        local element = updatedMatrix[y][x];
        if element == letter then
            updatedMatrix[y][x] = "-";
        end
    end
    return updatedMatrix;
end

--[[
    Funzione che permette l'inserimento di un Sempai
    all'interno della matrice in una specifica posizione x ed y.
    Se l'inserimento è possibile, torna la nuova matrice modificata,
    altrimenti torna comunuque una nuova matrice, ma con le stesse
    caratteristiche della matrice presa in considerazione.
]]
function M.insertSempai(matrix, sempai, x, y)
    local updatedMatrix = cloneFunctions.cloneMatrix(matrix);
    local updatedSempai = cloneFunctions.cloneSempai(sempai);
    if M.checkPosition(updatedMatrix, x, y) then
        if M.isEmptyInMatrix(updatedMatrix, updatedSempai.x, updatedSempai.y) then
            updatedSempai.x = x;
            updatedSempai.y = y;
            updatedMatrix[y][x] = updatedSempai;
        end
    end
    return updatedMatrix;
end

--[[
    Funzione che permette di rimuovere un Sempai all'interno
    della matrice, qualora fosse possibile.
    Se la rimozione risulta possibile, torna una nuova matrice aggiornata
    con il Sempai rimosso, altrimenti torna comunque una nuova matrice,
    ma con le stesse caratteristiche della matrice presa in considerazione.
]]
function M.removeSempai(matrix, sempai)
    local updatedMatrix = cloneFunctions.cloneMatrix(matrix);
    if M.checkPosition(updatedMatrix, sempai.x, sempai.y) then
        local element = updatedMatrix[sempai.y][sempai.x];
        if element.umilta ~= nil then
            updatedMatrix[sempai.y][sempai.x] = "-";
        end
    end
    return updatedMatrix;
end

--[[
    Funzione che scorre tutta la matrice
    per trovare i Sempai al suo interno.
]]
function M.getSempaiList(matrix)
    local sempaiList = {};
    -- Trova tutti i Sempai della matrice:
    for i = 1, #matrix do
        for j = 1, #matrix[i] do
            local element = matrix[i][j];
            if element ~= '-' and element.umilta ~= nil then
                table.insert(sempaiList, element);
            end
        end
    end
    return sempaiList;
end

return M;
