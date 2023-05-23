local cloneFunctions = require('utils.clone_functions');

local M = {};

--[[
    Funzione che permette di creare un
    Sempai, con tutti i valori impostati a 0
    ma con una specifica posizione (x ed y).
]]
function M.createSempai(x, y)
    local sempai = { x = x, y = y, umilta = 0, coraggio = 0, gentilezza = 0, rispetto = 0 };
    return sempai;
end

--[[
    Funzione che permette di incrementare una
    specifica proprietà ad uno specifico Sempai, qualora
    sia possibile. Se l'operazione va a buon fine, viene
    ritornato un nuovo Sempai aggiornato, altrimenti viene comunque
    ritornato un nuovo Sempai (per non mantenere lo stato) ma con le
    stesse caratteristiche.
]]
function M.increaseProperty(sempai, property)
    local updatedSempai = cloneFunctions.cloneSempai(sempai);
    if property == 'U' then
        if updatedSempai.umilta < 5 then
            local actual = updatedSempai.umilta;
            updatedSempai.umilta = actual + 1;
        end
    elseif property == 'C' then
        if updatedSempai.coraggio < 5 then
            local actual = updatedSempai.coraggio;
            updatedSempai.coraggio = actual + 1;
        end
    elseif property == 'G' then
        if updatedSempai.gentilezza < 5 then
            local actual = updatedSempai.gentilezza;
            updatedSempai.gentilezza = actual + 1;
        end
    elseif property == 'R' then
        if updatedSempai.rispetto < 5 then
            local actual = updatedSempai.rispetto;
            updatedSempai.rispetto = actual + 1;
        end
    end
    return updatedSempai;
end

--[[
    Funzione che permette di calcolare il valore
    totale delle proprietà di un determinato Sempai.
]]
function M.sempaiTotalScore(sempai)
    local result = sempai.umilta + sempai.coraggio + sempai.gentilezza + sempai.rispetto;
    return result;
end

return M;
