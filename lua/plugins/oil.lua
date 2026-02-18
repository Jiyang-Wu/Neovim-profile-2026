return {
  "stevearc/oil.nvim",
  opts = {
    -- quality-of-life
    skip_confirm_for_simple_edits = false,
    view_options = {
      show_hidden = true,
    },
    -- keymaps inside the oil buffer (you can tweak anytime)
    keymaps = {
      ["<CR>"] = "actions.select",
      ["<C-v>"] = "actions.select_vsplit", -- open entry in a vertical split
      ["<C-s>"] = "actions.select_split",  -- open entry in a horizontal split
      ["<C-t>"] = "actions.select_tab",
      ["-"] = "actions.parent",            -- go up
      ["g."] = "actions.toggle_hidden",
      ["q"] = "actions.close",
    },
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
  keys = {
    -- <leader>e: open Oil in RIGHT split at parent dir of current file
    {
      "<leader>e",
      function()
        vim.cmd("rightbelow vsplit")
        require("oil").open(vim.fn.expand("%:p:h"))
      end,
      desc = "Oil (parent dir) in right split",
    },

    -- <leader>re: open Oil in RIGHT split at project root
    {
      "<leader>re",
      function()
        local root = vim.fs.root(0, { ".git", "pyproject.toml", "package.json", "Cargo.toml", "go.mod" })
          or vim.loop.cwd()
        vim.cmd("rightbelow vsplit")
        require("oil").open(root)
      end,
      desc = "Oil (project root) in right split",
    },
  },
}
