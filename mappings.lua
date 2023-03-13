-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    ["<leader>bm"] = { "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Make it rain"},
    ["<leader>bg"] = { "<cmd>CellularAutomaton game_of_life<cr>", desc = "Game of life"},
    ["<leader>ss"] = { "<cmd>LiveServer start<cr>", desc = "start http server"},
    ["<leader>sk"] = { "<cmd>LiveServer start<cr>", desc = "kill http server"},

    -- TERM RUN --
    ["<leader>rt"] = { "<cmd>Run<cr>", desc = "Terminal run"},

    -- Lite Run --
    ["<leader>rp"] = { "<cmd>w <bar> !python %<cr>", desc = "Python"},
    ["<leader>rc"] = { "<cmd>w <bar> !clang % -o /data/data/com.termux/files/home/termux/clang/compiles/%:r && /data/data/com.termux/files/home/termux/clang/compiles/%:r<cr>", desc = "C"},
    ["<leader>ru"] = { "<cmd>w <bar> !clang++ % -o /data/data/com.termux/files/home/termux/cpp/compiles/%:r && /data/data/com.termux/files/home/termux/cpp/compiles/%:r<cr>", desc = "Cpp"},
    ["<leader>rj"] = { "<cmd>w <bar> !javac -d /data/data/com.termux/files/home/termux/java/classes % && java -cp /data/data/com.termux/files/home/termux/java/classes %:r<cr>", desc = "Java"},
    ["<leader>rl"] = { "<cmd>w <bar> !lua %<cr>", desc = "Lua"},
    ["<leader>rn"] = { "<cmd>w <bar> !node %<cr>", desc = "Javascript"},

    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>s"] = { name = "Server" },
    ["<leader>r"] = { name = "Run program" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
