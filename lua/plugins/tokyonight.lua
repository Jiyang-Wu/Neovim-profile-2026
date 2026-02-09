return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          functions = { italic = false },
          variables = { italic = false },
        },
    },
    config = function()
        -- Setting up Color Scheme
        vim.o.background = "dark"
        vim.cmd.colorscheme("tokyonight")
    end
}
