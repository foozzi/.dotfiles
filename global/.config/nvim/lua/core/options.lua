local opt = vim.opt
local api = vim.api

local M = {}

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.number = true
opt.relativenumber = false
opt.termguicolors = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
-- opt.signcolumn = "number"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"
-- opt.guicursor = ""
opt.showmode = false
-- opt.tabline = '%!v:lua.require("utils").tabline()'
opt.conceallevel = 2
opt.breakindent = true
opt.breakindentopt = "shift:2"

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.modifiable = true
-- opt.guicursor =
-- 	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
opt.encoding = "UTF-8"
opt.cursorline = false

-- spell
opt.spelllang = "en_us,ru"
opt.spell = true

-- api.nvim_set_option_value(
-- 	"langmap",
-- 	"йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',ё\\,яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё/|"
--)

vim.opt.langmap = {
	"йq",
	"цw",
	"уe",
	"кr",
	"еt",
	"нy",
	"гu",
	"шi",
	"щo",
	"зp",
	"х[",
	"ъ]",
	"фa",
	"ыs",
	"вd",
	"аf",
	"пg",
	"рh",
	"оj",
	"лk",
	"дl",
	"ж\\;",
	"э'",
	"ё\\,",
	"яz",
	"чx",
	"сc",
	"мv",
	"иb",
	"тn",
	"ьm",
	"б\\,",
	"ю.",
	"ЙQ",
	"ЦW",
	"УE",
	"КR",
	"ЕT",
	"НY",
	"ГU",
	"ШI",
	"ЩO",
	"ЗP",
	"Х{",
	"Ъ}",
	"ФA",
	"ЫS",
	"ВD",
	"АF",
	"ПG",
	"РH",
	"ОJ",
	"ЛK",
	"ДL",
	"Ж:",
	'Э"',
	"ЯZ",
	"ЧX",
	"СC",
	"МV",
	"ИB",
	"ТN",
	"ЬM",
	"Б<",
	"Ю>",
	"Ё/",
}

M.zettelkasten_dir = vim.fn.expand("~/PKM/01 - zettelkasten/")
M.resources_dir = vim.fn.expand("~/PKM/05 - resources/")
M.pkm_dir = vim.fn.expand("~/PKM/")

return M
