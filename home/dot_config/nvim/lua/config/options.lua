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
  -- if
  --   vim.fn.exists("$SSH_CONNECTION") == 1
  --   or vim.fn.executable("pstree") == 0
  --   -- or vim.fn.system("pstree -sl $$ | grep -q sshd && echo 1 || echo 0"):match("1")
  --   or vim.fn.system("pstree -sl $$ | grep -q sshd; echo $?"):match("0")
  -- then
  --   -- Check if comming via ssh. The pstree check catches the sudo case also
  --   -- but relies on pstree which is not allway available
  --   if vim.fn.executable("pstree") == 0 then
  --     vim.notify("pstree not installed. Assuming SSH_CONNECTION", vim.log.levels.WARN)
  --   end
  --   -- If using ssh then there exists no clipboard. You can only copy and
  --   -- paste characters from / into terminal window.
  --   -- So we remove any clutter we don't want to copy here
  --   -- See also snacks.lua
  --   opt.mouse = "h" -- In Putty mouse mode is bad - so only for help files
  --   opt.number = false -- We don't want terminal mouse copy line numbers
  --   opt.relativenumber = false
  --   opt.signcolumn = "no" -- Removes the column on the left side (Breakpoints, Gutter)
  --   vim.o.statuscolumn = "" -- Removes the column on the left side
  -- end

  -- simple & fast SSH detection: only use environment
  local is_ssh = vim.fn.exists("$SSH_CONNECTION") == 1 or vim.fn.exists("$SSH_TTY") == 1

  if is_ssh then
    -- If using ssh then there exists no clipboard. You can only copy and
    -- paste characters from / into terminal window.
    -- So we remove any clutter we don't want to copy here
    opt.mouse = "h" -- In Putty mouse mode is bad - so only for help files
    opt.number = false -- We don't want terminal mouse copy line numbers
    opt.relativenumber = false
    opt.signcolumn = "no" -- Removes the column on the left side (Breakpoints, Gutter)
    vim.o.statuscolumn = "" -- Removes the column on the left side
    -- the following variable is used in snacks.lua
    vim.g.is_ssh_session = true
  else
    -- the following variable is used in snacks.lua
    vim.g.is_ssh_session = false
  end
end

-- DifOrig: Diff unsaved changes of current buffer against it's saved state
vim.cmd("command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis")

-- Include a local configuration if exists
local local_init = vim.fn.stdpath("config") .. "/lua/config/options_local.lua"
if vim.fn.filereadable(local_init) == 1 then
  dofile(local_init)
end
