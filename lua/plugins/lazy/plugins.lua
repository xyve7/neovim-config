return {
	{
		"catppuccin/nvim",
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		{ 'wakatime/vim-wakatime', lazy = false },
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.5",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{
			"nvim-tree/nvim-tree.lua",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		"yamatsum/nvim-cursorline",
		{
			"folke/todo-comments.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = {
				-- your configuration cocargo install styluames here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
		},
		{
			"nvimtools/none-ls.nvim",
			dependencies = {
				"nvimtools/none-ls-extras.nvim",
			},
		},
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
		},
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"neovim/nvim-lspconfig",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-vsnip",
				"hrsh7th/vim-vsnip",
			},
		},
		{
			"ray-x/lsp_signature.nvim",
			event = "VeryLazy",
		},
		"nvim-treesitter/nvim-treesitter",
		"f3fora/cmp-spell",
		{
			"debugloop/telescope-undo.nvim",
			dependencies = { -- note how they're inverted to above example
				{
					"nvim-telescope/telescope.nvim",
					dependencies = { "nvim-lua/plenary.nvim" },
				},
			},
		},
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			init = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
			end,
		},
	},
}
