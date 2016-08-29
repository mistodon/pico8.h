-- aspects --

scenemodel = (function()
  local module = {
    add = function(self, obj)
      for name, objlist in pairs(self) do
        if (obj[name]) add(objlist, obj)
      end
    end,
    remove = function(self, obj)
      for name, objlist in pairs(self) do
        del(objlist, obj)
      end
    end
  }
  module.__index = module
  module.new = function(aspects)
    local t = {}
    for name in all(aspects) do
      t[name] = {}
    end
    return setmetatable(t, module)
  end
  return module
end)()