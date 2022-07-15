local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.setup {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ...
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = false, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
			},
		spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
		},
	icons = {
		breadcrumb = "?", -- symbol used in the command line area that shows your active key combo
		separator = "?", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
		},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
		},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
		},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
		},
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
		},
	}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
	}

-- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
-- see https://neovim.io/doc/user/map.html#:map-cmd
local vmappings = { }

local mappings = {
	["W"] = { "<cmd>w!<CR>", "Save" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	["m"] = { "<cmd>FixWhitespace<cr>", "Remove trailing space"},
	c = {
		name = "Code",
		c = { "<cmd>call CompileRun()<cr>", "CompileRun" },
		f = { vim.lsp.buf.formatting, "Formatting code"},
		},
	w = {
		name = "Windows",
		j = {"<cmd>wincmd j<CR>", "window down"},
		k = {"<cmd>wincmd k<CR>", "window up"},
		h = {"<cmd>wincmd h<CR>", "window left"},
		l = {"<cmd>wincmd l<CR>", "window right"},
		},
	b = {
		name = "Buffers",
		j = { "<cmd>BufferLinePick<CR>", "Jump" },
		f = { "<cmd>Telescope buffers<CR>", "Find" },
		b = { "<cmd>BufferLineCyclePrev<CR>", "Previous" },
		d = { "<cmd>Bdelete!<CR>", "Close Buffer" },
		e = {
			"<cmd>BufferLinePickClose<cr>",
			"Pick which buffer to close",
			},
		D = {
			"<cmd>BufferLineSortByDirectory<cr>",
			"Sort by directory",
			},
		L = {
			"<cmd>BufferLineSortByExtension<cr>",
			"Sort by language",
			},
		},
	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
		D = { vim.lsp.buf.type_definition, "Type Definition"},
		w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = { vim.diagnostic.goto_next, "Next Diagnostic", },
		k = { vim.diagnostic.goto_prev, "Prev Diagnostic", },
		l = { vim.lsp.codelens.run, "CodeLens Action" },
		q = { vim.diagnostic.setloclist, "Quickfix" },
		r = { vim.lsp.buf.rename, "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
			},
		e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
		},
	f = {
		name = "File",
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		t = { "<cmd>NvimTreeToggle<CR>", "File tree"},
		},
  t = {
    name = "Text",
		t = { "<cmd>Telescope live_grep<cr>", "Text" },
  },
  d = {
    name = "Debugger",
  },
	s = {
		name = "Search",
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		},
  G = {
    name = "Git",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  },
	p = {
		name = "Project",
		p = { "<cmd>Telescope projects<cr>", "Find Project"},
		},
	T = {
		name = "Treesitter",
		i = { ":TSConfigInfo<cr>", "Info" },
		},
	}

wk.register(mappings, opts)
wk.register(vmappings, vopts)

