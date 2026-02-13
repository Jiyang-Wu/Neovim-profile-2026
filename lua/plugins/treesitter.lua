return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        -- Setting up treesitter
        require("nvim-treesitter").install(
            { "lua", "python", "javascript", "c", "cpp" },
            { summary = false }
        ):wait(3000)
    end
}
