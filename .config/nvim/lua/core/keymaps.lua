-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set({ "n", "v" }, "??", "zz")

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", vim.tbl_extend("force", opts, { desc = "[V]ertical window" }))
vim.keymap.set("n", "<leader>h", "<C-w>s", vim.tbl_extend("force", opts, { desc = "[H]orizontal window" }))
-- vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>x", ":close<CR>", vim.tbl_extend("force", opts, { desc = "Close this window" }))

-- Navigate between splits
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Tabs
-- vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
-- vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
-- vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
-- vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab
vim.keymap.set("n", "<leader>w", function()
	vim.cmd("tab split")
end, { desc = "tab split (pseudo full screen)" })

local feedkeys = function(keys)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), "n", true)
end

vim.keymap.set("n", "<leader>1", function()
	feedkeys("1gt")
end, { desc = "Go to tab 1" })

vim.keymap.set("n", "<leader>2", function()
	feedkeys("2gt")
end, { desc = "Go to tab 2" })

vim.keymap.set("n", "<leader>3", function()
	feedkeys("3gt")
end, { desc = "Go to tab 3" })

vim.keymap.set("n", "<leader>4", function()
	feedkeys("4gt")
end, { desc = "Go to tab 4" })

vim.keymap.set("n", "<leader>5", function()
	feedkeys("5gt")
end, { desc = "Go to tab 5" })

vim.keymap.set("n", "<leader>6", function()
	feedkeys("6gt")
end, { desc = "Go to tab 6" })

vim.keymap.set("n", "<leader>7", function()
	feedkeys("7gt")
end, { desc = "Go to tab 7" })

vim.keymap.set("n", "<leader>8", function()
	feedkeys("8gt")
end, { desc = "Go to tab 8" })

vim.keymap.set("n", "<leader>9", function()
	feedkeys("9gt")
end, { desc = "Go to tab 9" })

vim.keymap.set("n", "<leader>0", function()
	vim.cmd("tablast")
end, { desc = "Go to last tab" })

-- Diagnostic keymaps
vim.keymap.set("n", "dp", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous diagnostic message" })

vim.keymap.set("n", "dn", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic message" })

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
