-- classes --

function classify(module)
  module.__index = module
  module._inst = function(t)
    return setmetatable(t or {}, module)
  end
  module.new = module._inst
  return module
end
