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
          startify.button("r", "  Recent files", ":FzfLua oldfiles<CR>"),
          startify.button("l", "  Lazy", ":Lazy<CR>"),
          startify.button("x", "󰏖  LazyExtras", ":LazyExtras<CR>"),
        },
      },
      { type = "padding", val = 1 },
      {
        type = "group",
        val = {
          startify.button("q", "  Quit", ":qa<CR>"),
        },
      },
      { type = "padding", val = 1 },
      startify.section.footer,
    }

    -- Setup Alpha mit dem angepassten Layout
    alpha.setup(startify.config)
  end,
}
