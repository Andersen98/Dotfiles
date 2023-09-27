return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
		opts = {},
	},
	{ url = "https://github.com/fladson/vim-kitty" },
	{ "lervag/vimtex", lazy = false },
	{ "junegunn/goyo.vim" },
}
