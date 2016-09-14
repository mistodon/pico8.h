-- grid --
grid = (function()
  module = classify({
    hash = function(vec)
      return shl(vec.x, 8) + vec.y
    end,

    add = function(self, pos, item)
      self.data[grid.hash(pos)] = item
    end,

    remove = function(self, pos)
      local result = self:get(pos)
      self:add(pos, nil)
      return result
    end,

    get = function(self, pos, default)
      return self.data[grid.hash(pos)] or default
    end
  })
  module.new = function()
    local grid = module._inst()
    grid.data = {}
    return grid
  end
  return module
end)()
