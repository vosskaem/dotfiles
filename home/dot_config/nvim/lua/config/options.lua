-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false
vim.g.autoformat = false

local opt = vim.opt

opt.spelllang = { "en", "de" }

if vim.fn.has("gui_running") == 1 then
  opt.lines = 50
  opt.columns = 120
  opt.mouse = "a"
  opt.number = true
  opt.relativenumber = true
else

  local function has_wayland_clipboard()
    local wd = vim.env.WAYLAND_DISPLAY
    local rd = vim.env.XDG_RUNTIME_DIR
    if not wd or wd == "" or not rd or rd == "" then
      return false
    end
    return vim.fn.filereadable(rd .. "/" .. wd) == 1
  end

  local function has_x11_clipboard()
    -- Need an X display at all
    local d = vim.env.DISPLAY
    if not d or d == "" then
      return false
    end

    -- Fast path if env is present
    local st = vim.env.XDG_SESSION_TYPE
    if st == "x11" then
      return true
    elseif st == "wayland" then
      return false
    end

    -- Fallback: ask logind for the session type of the *real user* (works for sudo -i)
    local uid = tonumber(vim.env.SUDO_UID or "") or vim.fn.getuid()

    local sessions = vim.fn.systemlist({ "loginctl", "list-sessions", "--no-legend" }) or {}
    for _, line in ipairs(sessions) do
      local sid = line:match("^(%S+)")
      if sid then
        local u = (vim.fn.systemlist({ "loginctl", "show-session", sid, "-p", "User", "--value" }) or {})[1]
        if tonumber(u) == uid then
          local t = ((vim.fn.systemlist({ "loginctl", "show-session", sid, "-p", "Type", "--value" }) or {})[1] or ""):lower()
          return t == "x11"
        end
      end
    end

    -- If we can't determine session type reliably, treat as "not safely X11"
    return false
  end

  -- the following variable is also used in snacks.lua
  vim.g.is_clipboard_possible = has_wayland_clipboard() or has_x11_clipboard()

  -- UI adjustments when clipboard is NOT possible
  if not vim.g.is_clipboard_possible then

    -- If there exists no clipboard. You can only copy and
    -- paste characters from / into terminal window.
    -- So we remove any clutter we don't want to copy here
    opt.mouse = "h" -- In Putty mouse mode is bad - so only for help files
    opt.number = false -- We don't want terminal mouse copy line numbers
    opt.relativenumber = false
    opt.signcolumn = "no" -- Removes the column on the left side (Breakpoints, Gutter)
    vim.o.statuscolumn = "" -- Removes the column on the left side
    -- the following variable is used in snacks.lua
    vim.g.is_ssh_session = true
  end
end

-- DifOrig: Diff unsaved changes of current buffer against it's saved state
vim.cmd("command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis")

-- Include a local configuration if exists
local local_init = vim.fn.stdpath("config") .. "/lua/config/options_local.lua"
if vim.fn.filereadable(local_init) == 1 then
  dofile(local_init)
end
