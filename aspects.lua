-- aspects --

scenemodel = (function()
  local module = {
    add = function(self, obj)
      for name, objlist in pairs(self) do
        if (obj[name]) add(objlist, obj)
      end
      return obj
    end,
    remove = function(self, obj)
      for name, component in pairs(obj) do
        del(self[name], obj)
      end
      return nil
    end,
    trash = function(self, obj)
      add(self._trash, obj)
    end,
    clean = function(self)
      for obj in all(self._trash) do
        self:remove(obj)
      end
    end
  }
  classify(module)
  module.new = function(aspects)
    local t = {_trash = {}}
    for name in all(aspects) do
      t[name] = {}
    end
    return module._inst(t)
  end
  return module
end)()

entity = classify({})