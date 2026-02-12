return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },

	version = "1.*",
	opts = {
		keymap = {
			preset = "default",
			["<CR>"] = { "accept", "fallback" },
			["<C-e>"] = { "scroll_documentation_down", "snippet_forward" },
			["<C-u>"] = { "scroll_documentation_up", "snippet_backward" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "snippet_backward", "fallback" },
			["<Tab>"] = { "cancel", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = { documentation = { auto_show = false } },

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		signature = {
			enabled = true,
			trigger = {
				blocked_trigger_characters = {},
				blocked_retrigger_characters = {},
				-- When true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
				show_on_insert_on_trigger_character = true,
			},
			window = {
                show_documentation = true,
				min_width = 1,
				max_width = 120,
				max_height = 12,
				border = "rounded",
				winblend = 0,
				winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
				scrollbar = false, -- Note that the gutter will be disabled when border ~= 'none'
				-- Which directions to show the window,
				-- falling back to the next direction when there's not enough space,
				-- or another window is in the way
				direction_priority = { "n", "s" },
				-- Disable if you run into performance issues
				treesitter_highlighting = true,
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
