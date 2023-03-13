return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "f3fora/cmp-spell",
  },
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    -- modify the sources part of the options table
    opts.sources = cmp.config.sources {
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 750 },
      { name = "buffer", priority = 500 },
      { name = "path", priority = 250 },
      {
        name = "spell",
        priority = 300,
        option = {
          keep_all_entries = false,
          enable_in_context = function()
            return true
          end,
        }
      }, -- add new source
    }
    return opts
  end,
}
