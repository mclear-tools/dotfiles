-- Create handout from paper structure
-- https://groups.google.com/forum/#!searchin/pandoc-discuss/handout%7Csort:date/pandoc-discuss/CaSa9JqYU3Q/g73chYFJAQAJ

function Pandoc(doc) 
    local hblocks = {} 
    for i,el in pairs(doc.blocks) do 
        if (el.t == "Div" and el.classes[1] == "handout") or 
           (el.t == "BlockQuote") or 
           (el.t == "OrderedList" and el.style == "Example") or 
           (el.t == "Para" and #el.c == 1 and el.c[1].t == "Image") or 
           (el.t == "Header") then 
           table.insert(hblocks, el) 
        end 
    end 
    return pandoc.Pandoc(hblocks, doc.meta) 
end 
