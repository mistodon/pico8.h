-- render --

render = {
  shtext = function(str, x, y, col, scol, sx, sy)
    sx = sx or 1
    sy = sy or 1
    print(str, x+sx, y+sy, scol)
    print(str, x, y, col)
  end,
  oltext = function(str, x, y, col, ocol)
    print(str, x-1, y, ocol)
    print(str, x+1, y, ocol)
    print(str, x, y-1, ocol)
    print(str, x, y+1, ocol)
    print(str, x, y, col)
  end
}