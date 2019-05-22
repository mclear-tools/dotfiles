-- cuthead.lua - remove headings in Pandoc

local cuthead = function (head)
    if head.identifier == "introduction"  then
        return {} -- "empty list" == remove
    elseif head.identifier == "footnotes" then
       return {}
    elseif head.classes:includes('ignore',1) then
       return {}
    else
        return head
    end
end

return { { Header = cuthead } }
