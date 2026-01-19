return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000,
	config = function()
		require("everforest").setup({
			transparent_background_level = 0,
			italics = true,
			ui_contrast = "high",
			inlay_hints_background = "dimmed",
		})
		vim.cmd([[colorscheme everforest]])
	end,
}
