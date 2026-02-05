return {
	"sindrets/diffview.nvim",
	lazy = false,
	opts = {
		file_panel = {
			win_config = {
				position = "left",
				width = 45,
				win_opts = {},
			},
		},
		view = {
			merge_tool = {
				layout = "diff3_mixed",
				disable_diagnostics = false,
			},
		},
		hooks = {
			diff_buf_read = function(bufnr, ctx)
				-- Change local options in diff buffers

				-- print("symbol:", ctx.symbol)
				-- print("layout_name:", ctx.layout_name)

				-- Here, I'm targeting the editing window for git diffs
				if ctx.symbol == "b" and ctx.layout_name == "diff3_mixed" then
					vim.opt_local.wrap = true
				else
					vim.opt_local.wrap = false
				end
			end,
			diff_buf_win_enter = function(bufnr, winid, ctx)
				-- Add custom labels to buffers
				if ctx.layout_name:match("^diff") then
					-- Check if this is a merge conflict (3-way diff)
					if ctx.layout_name == "diff3_mixed" then
						-- Merge conflict labels
						if ctx.symbol == "a" then
							vim.wo[winid].winbar = "%#DiffAdd#  OURS (Current Changes) %*"
						elseif ctx.symbol == "b" then
							vim.wo[winid].winbar = "%#DiffChange#  MERGE (Edit Here) %*"
						elseif ctx.symbol == "c" then
							vim.wo[winid].winbar = "%#DiffDelete#  THEIRS (Incoming Changes) %*"
						end
					else
						-- Regular diff labels (2-way comparison)
						if ctx.symbol == "a" then
							vim.wo[winid].winbar = "%#DiffText#  BASE (Original) %*"
						elseif ctx.symbol == "b" then
							vim.wo[winid].winbar = "%#DiffAdd#  CHANGES (Modified) %*"
						end
					end
				end
			end,
		},
	},
	keys = {
		-- Open/close diffview
		{ "<leader>go", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
		{ "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
		{ "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "[G]it File [H]istory" },
		{ "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "[G]it Current File [H]istory" },

		-- Common workflows
		{ "<leader>gm", "<cmd>DiffviewOpen origin/main...HEAD<cr>", desc = "[G]it Diff against main" },
		{ "<leader>gr", "<cmd>DiffviewRefresh<cr>", desc = "Refresh Diffview" },
		{ "<leader>gf", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle Files Panel" },
	},
}
