return {
	{
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
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		opts = ...,
	},
	{
		"blazkowolf/gruber-darker.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			bold = false,
			italic = {
				strings = false,
				comments = false,
				operators = false,
				folds = false,
			},
		},
	},
	{
		"vague-theme/vague.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other plugins
		config = function()
			-- NOTE: you do not need to call setup if you don't want to.
			require("vague").setup({
				italic = false,
				bold = false,
				-- optional configuration here
			})
			vim.cmd("colorscheme vague")
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- you can set set configuration options here
		-- config = function()
		--     vim.g.zenbones_darken_comments = 45
		--     vim.cmd.colorscheme('zenbones')
		-- end
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
			require("nordic").setup({
				italic_comments = false,
			})
		end,
	},
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_italic = false
			vim.g.nord_bold = false
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_enable_italic = false
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
