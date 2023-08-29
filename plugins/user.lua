return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  "nyoom-engineering/oxocarbon.nvim",
  {
    "barrett-ruth/live-server.nvim",
    config = true,
  },
  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },
  {
    "smolck/command-completion.nvim",
    lazy = false,
    config = function ()
      require('command-completion').setup()
    end,
  },
}
