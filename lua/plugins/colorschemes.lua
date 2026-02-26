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
}
