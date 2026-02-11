require("config.lazy")

-- Neovim basic setup
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.g.mapleader = " "
vim.opt.smartindent = true
vim.diagnostic.config({ virtual_text = true })
vim.opt.clipboard = "unnamedplus"

-- Cursor colors
vim.opt.termguicolors = true
-- vim.api.nvim_set_hl(0, "Cursor",       { bg = "#D679D6", fg = "#000000" })
-- vim.api.nvim_set_hl(0, "CursorInsert", { bg = "#D679D6", fg = "#000000" })
-- vim.api.nvim_set_hl(0, "CursorVisual", { bg = "#D679D6", fg = "#000000" })
if vim.g.neovide then
	vim.o.guifont = "FiraMono Nerd Font Mono:h15"
end

local opts = {}

-- LSP related keybindings
-- Jumping
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)

-- Inspect
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

-- Diagnostics
vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, { desc = "Show Diagnostic" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Prev diagnostic" })

vim.keymap.set("n", "]e", function()
	vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next error" })
vim.keymap.set("n", "[e", function()
	vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
end, { desc = "Prev error" })

-- Search
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "gs", vim.lsp.buf.document_symbol, opts)
vim.keymap.set("n", "gS", vim.lsp.buf.workspace_symbol, opts)

-- Refactor
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- Format
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end, opts)
