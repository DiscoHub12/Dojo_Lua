local M = {};

--[[
    Funzione che permette di stampare
    una matrice, passata come parametro
    se esiste e possibile, altrimenti stampa :
    'Matrice inesistente.'
]]
function M.printMatrix(matrix)
    if matrix == nil then
        io.write('Matrice inesistente.');
    end
    print('\n');
    print('       MATRIX')
    local n = #matrix
    for i = n, 1, -1 do
        for j = 1, n do
            local element = matrix[i][j]
            if type(element) == "table" then
                io.write("S ")
            else
                io.write(element .. " ")
            end
        end
        io.write("\n")
    end
end

--[[
    Funzione che permette di stampare
    un Sempai (tutte le sue caratteristiche),
    se esiste e possibile, altrimenti stampa :
    'Sempai inesistente.'
]]
function M.printSempai(sempai)
    if sempai == nil then
        print('Sempai inesistente.');
    end
    print("-SEMPAI PROPERTY");
    print("1.U = " .. sempai.umilta);
    print("2.C = " .. sempai.coraggio);
    print("1.G = " .. sempai.gentilezza);
    print("1.R = " .. sempai.rispetto);
    print("stay at : (" .. sempai.x .. "," .. sempai.y .. ")");
end

return M;