return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        -- Setting up treesitter
        local config = require("nvim-treesitter.config")
        config.setup({
            ensure_installed = {"lua", "javascript", "c", "cpp"},
            highlight = {enable = true},
            indent = {enable = true},
        })
    end
}
