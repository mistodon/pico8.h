-- vectors --

vector = (function()
  local ops = {
    add = function(a, b) return a + b end,
    sub = function(a, b) return a - b end,
    mul = function(a, b) return a * b end,
    div = function(a, b) return a / b end,
    mod = function(a, b) return a % b end,
    pow = function(a, b) return a ^ b end
  }
  local vecop = function(v0, v1, func)
    local result = {}
    for k, v in pairs(v0) do
      local c = (type(v1) == "table") and v1[k] or v1
      result[k] = func(v, c)
    end
    return vector.new(result)
  end
  local module = {
    __add = function(a, b) return vecop(a, b, ops.add) end,
    __sub = function(a, b) return vecop(a, b, ops.sub) end,
    __mul = function(a, b) return vecop(a, b, ops.mul) end,
    __div = function(a, b) return vecop(a, b, ops.div) end,
    __mod = function(a, b) return vecop(a, b, ops.mod) end,
    __pow = function(a, b) return vecop(a, b, ops.pow) end,
    __unm = function(a) return a * -1 end,

    manh = function(u)
      local sum = 0
      for k, v in pairs(u) do
        sum += abs(v)
      end
      return sum
    end,

    dot = function(a, b)
      local u = a * b
      u:manh()
    end,

    mag2 = function(u)
      return u:dot(u)
    end,

    mag = function(u)
      return sqrt(u:mag2())
    end,

    str = function(a)
      local s = "("
      for k, v in pairs(a) do
        s = s..k.."="..v..", "
      end
      return s .. ")"
    end,

    zero = function(a)
      return a:manh() == 0
    end
  }
  module.__index = module
  module.new = function(t)
    return setmetatable(t, module)
  end
  return module
end)()

function vec(x, y)
  return vector.new({x=x, y=y})
end
