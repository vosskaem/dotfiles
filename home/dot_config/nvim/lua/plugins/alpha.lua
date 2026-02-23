-- if true then return {} end

-- return
-- {
--   "goolord/alpha-nvim",
--   dependencies = { "echasnovski/mini.icons" },
--   config = function()
--     require("alpha").setup(require("alpha.themes.startify").config)
--   end,
-- }


return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-mini/mini.icons" },
  config = function()
    local alpha = require("alpha")
    local startify = require("alpha.themes.startify")

    -- Stelle sicher, dass buttons initialisiert wird
    startify.config.layout = {
      -- { type = "padding", val = 1 },
      startify.section.header,
      { type = "padding", val = 1 },
      startify.section.top_buttons,
      -- { type = "padding", val = 1 },
      startify.section.mru_cwd,
      -- { type = "padding", val = 1 },
      startify.section.mru,
      { type = "padding", val = 1 },
      -- Manuelle Button-Definition
      {
        type = "group",
        val = {
          -- startify.button("f", "  Find file", ":FzfLua files<CR>"),
          startify.button("p", "  Projects", ":lua Snacks.picker.projects()<CR>"),
          startify.button("r", "  Recent files", ":lua Snacks.dashboard.pick('oldfiles')<CR>"),
          startify.button( "c", "  Config files", ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})<CR>"),
          startify.button("l", "󰒲  Lazy", ":Lazy<CR>"),
          startify.button("x", "󰏖  LazyExtras", ":LazyExtras<CR>"),
          startify.button("m", "  Mason", ":Mason<CR>"),
          -- 
          -- 󰏖
        },
      },
      { type = "padding", val = 1 },
      {
        type = "group",
        val = {
          -- startify.button("q", "󰗼  Quit", ":qa<CR>"),
          startify.button("q", "󰩈  Quit", ":qa<CR>"),
        },
      },
      { type = "padding", val = 1 },
      startify.section.footer,
    }

    -- Setup Alpha mit dem angepassten Layout
    alpha.setup(startify.config)
  end,
}
