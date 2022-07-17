-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<leader>l", ":bnext<CR>", opts)
keymap("n", "<leader>h", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<leader>bd", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- treesitter fold
keymap("n", "zz", ":foldclose<CR>", opts)
keymap("n", "Z", ":foldopen<CR>", opts)

-- NvimTree
keymap("n", "<leader>nn", "<cmd>NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<Leader>fr", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>tt", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>pp", "<cmd>Telescope projects<cr>", opts)
keymap("n", "<leader>bf", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<leader>sk", "<cmd>Telescope keymaps<CR>", opts)

-- Hop
keymap('n', 's', function()
  return require('hop').hint_char2()
end,
  {silent = true, noremap = true, desc = 'nvim-hop char2'})

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- Better paste
keymap("v", "p", '"_dP', opts)

-- compile and run 
keymap('n', '<leader>cr', [[<cmd>lua require("user.utils").compile_run()<cr>]], opts)

-- cope 
keymap('n', "<leader>cc", [[:botright cope<cr>]], opts)
keymap('n', "<leader>co", [[ggVGy:tabnew<cr>:set syntax=qf<cr>pgg]], opts)
keymap('n', "<leader>n", [[:cn<cr>]], opts)
keymap('n', "<leader>p", [[:cp<cr>]], opts)

