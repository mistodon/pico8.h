-- animation --

anim = {
  frame = function(elapsed, frametime, numframes)
    return flr(elapsed / frametime) % numframes
  end,

  sprite = function(elapsed, frametime, frames, base, offset)
    offset = offset or 0
    return base + offset + frames[anim.frame(elapsed, frametime, #frames) + 1]
  end
}
