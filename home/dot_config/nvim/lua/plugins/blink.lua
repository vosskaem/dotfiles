return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      list = {
        selection = {
          -- do not accept first match on ENTER:
          preselect = false,
          auto_insert = true,
        },
      },
      keyword = {
        -- range = "prefix",
        -- range = "full",
        range = "full",
      },
      menu = {
        -- Don't automatically show the completion menu
        -- auto_show = false,
      },
    },
    keymap = {
      -- additional selection keys in the list
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
    },
  },
}
