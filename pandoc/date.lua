-- Set date in Pandoc
-- https://github.com/jgm/pandoc/issues/2865#issuecomment-321762244

function Meta(m)
  if m.date == nil then
  m.date = os.date("%B %e, %Y")
  return m
  end
end
