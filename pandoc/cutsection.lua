-- cutsection.lua - remove tagged sections in Pandoc output
-- heavily adapted from https://github.com/pandoc/lua-filters/tree/master/abstract-to-meta
-- with advice from https://groups.google.com/forum/#!topic/pandoc-discuss/qxLv486QcTQ

local looking_at_section = false
local lvl = 0

function Block (elem)
  if elem.t == "Header" then
    if elem.classes:includes('remove',1) then
      looking_at_section = true
      lvl = elem.level
    else
      looking_at_section = looking_at_section and elem.level > lvl
    end
  end
  if looking_at_section then
    return {}
  end
end
