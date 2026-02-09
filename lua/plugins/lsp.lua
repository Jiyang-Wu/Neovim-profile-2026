return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup()
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = { "lua_ls", "clangd", "pyright", "rust_analyzer" },
			automatic_installation = true,
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			local caps = require("blink.cmp").get_lsp_capabilities({
				textDocument = { completion = { completionItem = { snippetSupport = false } } },
			})
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local buf = ev.buf
					local map = function(lhs, rhs, desc)
						vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
					end

					map("gd", vim.lsp.buf.definition, "Go to definition")
					map("gD", vim.lsp.buf.declaration, "Go to declaration")
					map("gr", vim.lsp.buf.references, "References")
					map("gi", vim.lsp.buf.implementation, "Implementation")
					map("K", vim.lsp.buf.hover, "Hover")
					map("<leader>rn", vim.lsp.buf.rename, "Rename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code action")

					-- Diagnostics (non-deprecated)
					map("<leader>sd", function()
						vim.diagnostic.open_float(nil, { border = "rounded", source = "if_many" })
					end, "Show Diagnostics")
					map("]d", function()
						vim.diagnostic.jump({ count = 1 })
					end, "Next diagnostic")
					map("[d", function()
						vim.diagnostic.jump({ count = -1 })
					end, "Prev diagnostic")
				end,
			})

			vim.lsp.config("lua_ls", {
				capabilities = caps,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})

			vim.lsp.config("clangd", {
				capabilities = caps,
				-- cmd = { "clangd", "--background-index" }, -- optional
			})

			vim.lsp.config("pyright", {
				capabilities = caps,
			})

			vim.lsp.config("rust_analyzer", {
				capabilities = caps,
			})

			vim.lsp.enable({ "lua_ls", "clangd", "pyright", "rust_analyzer" })
		end,
	},
}
