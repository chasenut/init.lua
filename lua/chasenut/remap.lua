-- No need for mouse
vim.opt.mouse = ""
vim.opt.mousescroll = "ver:0,hor:0"
-- Throw away that arrows keys, use homerow
vim.keymap.set("", "<up>", "<nop>")
vim.keymap.set("", "<down>", "<nop>")
vim.keymap.set("", "<right>", "<nop>")
vim.keymap.set("", "<left>", "<nop>")

-- Disable sending ctrl-z signal (in zsh it closes neovim)
vim.keymap.set("n", "<C-z>", "<nop>")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move highlighted code up & down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append next line to current + cursor at the beggining (not end)
vim.keymap.set("n", "J", "mzJ`z")

-- Half page jump
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- When searching, cursor stays in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- When pasting over something, copy buffer remains the same,
-- normally it would be overwritten by highlighted term
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Allows to yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Don't look at this
vim.keymap.set("i", "<C-c", "<Esc>")

-- Disable Q keymap
vim.keymap.set("n", "Q", "<nop>")

-- Replace all words your cursor was on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Makes current file executable (for scripts etc.)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Harpoon
vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end)
vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end)
vim.keymap.set("n", "<C-h>", function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() require("harpoon.ui").nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() require("harpoon.ui").nav_file(4) end)

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>silent !tmux neww tmux-sessionizer -s 1<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>silent !tmux neww tmux-sessionizer -s 2<CR>")
vim.keymap.set("n", "<M-l>", "<cmd>silent !tmux neww tmux-sessionizer -s 3<CR>")

vim.keymap.set("n", "<leader>st", function()
    local file_dir = vim.fn.expand("%:p:h")
    vim.cmd.vnew()
    vim.cmd("lcd " .. file_dir)
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 5)
    vim.cmd("startinsert")
end)
