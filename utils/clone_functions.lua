local M = {};

--[[
    Funzione che permette di
    non mantenere lo stato della matrice passata,
    quindi ritorna una nuova matrice, con le stesse
    caratteristiche della matrice passata
    come parametri.
]]
function M.cloneMatrix(matrix)
    local newMatrix = {}
    for i = 1, #matrix do
        newMatrix[i] = {}
        for j = 1, #matrix[i] do
            newMatrix[i][j] = matrix[i][j]
        end
    end
    return newMatrix
end

--[[
    Funzione che permette di
    non mantenere lo stato del Sempai passato,
    quindi ritorna un nuovo Sempai , con le stesse
    caratteristiche del Sempai passato
    come parametri.
]]
function M.cloneSempai(sempai)
    local clonedSempai = {
        x = sempai.x,
        y = sempai.y,
        umilta = sempai.umilta,
        coraggio = sempai.coraggio,
        gentilezza = sempai.gentilezza,
        rispetto = sempai.rispetto
    };
    return clonedSempai;
end

return M;
