local function get_urgency(level)
  local levels = vim.log.levels
  if (level == levels.DEBUG) then
    return "low"
  elseif (level == levels.INFO) then
    return "normal"
  elseif (level == levels.WARN) then
    return "normal"
  elseif (level == levels.ERROR) then
    return "critical"
  elseif (level == levels.TRACE) then
    return "low"
  else
    local _ = level
    return "normal"
  end
end
local config = {command = "notify-send", icon = "nvim", app_name = "Neovim", hint = "string:desktop-entry:nvim"}
local function send(msg, level, opts)
  if not (level == vim.log.levels.OFF) then
    local function _2_(...)
      local t_3_ = opts
      if (nil ~= t_3_) then
        t_3_ = t_3_.command
      else
      end
      return t_3_
    end
    local function _5_(...)
      local t_6_ = opts
      if (nil ~= t_6_) then
        t_6_ = t_6_.icon
      else
      end
      return t_6_
    end
    local function _8_(...)
      local t_9_ = opts
      if (nil ~= t_9_) then
        t_9_ = t_9_.app_name
      else
      end
      return t_9_
    end
    local function _11_(...)
      local t_12_ = opts
      if (nil ~= t_12_) then
        t_12_ = t_12_.hint
      else
      end
      return t_12_
    end
    vim.system({(_2_() or config.command), msg, "--urgency", get_urgency(level), "--icon", (_5_() or config.icon), "--app-name", (_8_() or config.app_name), "--hint", (_11_() or config.hint)})
    return true
  else
    return nil
  end
end
local function setup(opts)
  return vim.extend(config, opts)
end
return {send = send, setup = setup}
