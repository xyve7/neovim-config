local cfg = vim.opt
local cmd = vim.cmd
local g = vim.g

-- Map leader
g.mapleader = " "

-- Set the tabs correctly
cfg.shiftwidth = 4
cfg.tabstop = 4
cfg.softtabstop = 4
cfg.smarttab = true

-- Line numbers
cfg.number = true
cfg.relativenumber = true

-- Remove the '~' marking the end of the buffer
cfg.fillchars = "eob: "

-- Enable system clipboard
cfg.clipboard = "unnamedplus"

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
cfg.termguicolors = true

-- Enable spell checker
cfg.spell = false
cfg.spelllang = { "en_us" }

-- Set default shell
if vim.loop.os_uname().sysname == "Darwin" then
	cfg.shell = "/bin/zsh"
else
	cfg.shell = "/usr/bin/zsh"
end

-- Set theme
vim.cmd([[colorscheme catppuccin-mocha]])

-- Run commands
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})
vim.diagnostic.config({ float = { border = "single" } })

-- Keybinds
-- General
vim.keymap.set("n", "<leader>u", ":Telescope undo<cr>")
vim.keymap.set("n", "<A-Right>", ":bn<cr>")
vim.keymap.set("n", "<A-Left>", ":bp<cr>")
vim.keymap.set("n", "<A-q>", ":bw<cr>")

-- LSP
-- Show diagnostic window for the error
vim.keymap.set("n", "<leader>.", vim.diagnostic.open_float)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = "single" })
		end, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Tree
local treeapi = require("nvim-tree.api")
vim.keymap.set("n", "<leader>e", treeapi.tree.toggle, {})
