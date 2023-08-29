return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "oxocarbon",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin", "matchparen" },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    local function runScript()

      local tail = vim.fn.expand("%:e")

      vim.cmd [[w]]

      if (tail == "") then
        print("Not a language!")
      elseif (tail == "java") then
        vim.cmd [[terminal javac -d /data/data/com.termux/files/home/termux/java/classes % && java -cp /data/data/com.termux/files/home/termux/java/classes %:r]]
      elseif (tail == "py") then
        vim.cmd [[terminal python %]]
      elseif (tail == "c") then
        vim.cmd [[terminal clang % -o /data/data/com.termux/files/home/termux/clang/compiles/%:r && /data/data/com.termux/files/home/termux/clang/compiles/%:r]]
      elseif (tail == "cpp") then
        vim.cmd [[terminal clang++ % -o /data/data/com.termux/files/home/termux/cpp/compiles/%:r && /data/data/com.termux/files/home/termux/cpp/compiles/%:r]]
      elseif (tail == "lua") then
        vim.cmd [[terminal lua %]]
      elseif (tail == "js") then
        vim.cmd [[terminal node %]]
      else
        print("Unknown language!")
      end
    end

    Funcs = {
      run = runScript,
    }

    --TERM RUN--
    vim.cmd [[command! Run lua Funcs.run()]]

  end,
}
