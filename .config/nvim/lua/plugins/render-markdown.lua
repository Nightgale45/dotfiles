return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	keys = {
		{
			"<leader>tr",
			function()
				require("render-markdown").toggle()
			end,
			desc = "[T]ggle Markdown [R]ender",
		},
	},
}
