local option = {
	backup = false,
	clipboard = "unnamedplus",
	completeopt = {"menuone", "noselect"},
	fileencoding = "utf-8",
	ignorecase = true,
	conceallevel = 0,
	tabstop = 2,
	numberwidth = 2,
  	syntax = "enable",
	mouse = "a",
	pumheight = 10,
	showtabline = 2,
	shiftwidth = 2,
	expandtab = true,
	smartindent = true,
	splitright = true,
	undofile = true,
	wrap = false,
	scrolloff = 8,
	updatetime = 200,
	splitbelow = true,
	guifont = "FiraMono",
	number = true,
	relativenumber = true,
	termguicolors = true,
  autochdir = true,
}

local status_ok, _ = pcall(vim.cmd, "hi Normal guibg=NONE ctermbg=NONE")

for k, v in pairs(option) do
	vim.opt[k] = v
end

local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end
