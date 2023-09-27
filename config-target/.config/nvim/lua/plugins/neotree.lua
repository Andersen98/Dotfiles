return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	},
	config = function()
		require("neo-tree").setup()
	end,
}, {
	"mickael-menu/zk-nvim",
	config = function()
		require("zk").setup({
			-- See Setup section below
		})
	end,
}
