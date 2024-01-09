local config = function()
	local lsp_zero = require("lsp-zero")
	local luasnip = require("luasnip")
	local diagnostic_signs = require("utils.icons").diagnostic_signs

	lsp_zero.on_attach(function(_, bufnr)
		vim.diagnostic.config({
			virtual_text = false, -- disable virtual text
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",

				header = "",
				prefix = "",
			},
		})

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = "rounded",
		})

		local opts = { buffer = bufnr, remap = false }

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "<leader>ca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "<leader>gi", function()
			vim.lsp.buf.implementation()
		end, opts)
		-- nvim-lint
		vim.keymap.set("n", "<leader>li", function()
			require("lint").try_lint()
		end, opts)
		-- conform
		vim.keymap.set("n", "<leader>fr", function()
			require("conform").format({ bufnr = bufnr })
		end, opts)
	end)

	lsp_zero.set_sign_icons({
		error = diagnostic_signs.Error,
		warn = diagnostic_signs.Warn,
		hint = diagnostic_signs.Hint,
		info = diagnostic_signs.Info,
	})

	require("mason").setup({})
	require("mason-lspconfig").setup({
		ensure_installed = {
			"bashls",
			"tsserver",
			"pyright",
			"lua_ls",
			"jsonls",
			"clangd",
			"ruff_lsp",
			"biome", -- will install for formatting only
		},
		automatic_installation = true,
		handlers = {
			lsp_zero.default_setup,
			lua_ls = function()
				local lua_opts = lsp_zero.nvim_lua_ls()
				require("lspconfig").lua_ls.setup(lua_opts)
			end,
			pyright = function()
				require("lspconfig").pyright.setup({
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "off",
							},
						},
					},
				})
			end,
			biome = function() -- use tsserver instead
				return {}
			end,
		},
	})

	local cmp = require("cmp")
	local cmp_select = { behavior = cmp.SelectBehavior.Select }
	require("luasnip/loaders/from_vscode").lazy_load()

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		preselect = "item",
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
		sources = {
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "buffer" },
		},
		formatting = lsp_zero.cmp_format(),
		mapping = cmp.mapping.preset.insert({
			-- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
			["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-f>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(1) then
					luasnip.jump(1)
				else
					fallback()
				end
			end, { "i", "s" }),

			["<C-b>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
	})
end

return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	config = config,
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			dependencies = { "rafamadriz/friendly-snippets" },
		},
	},
}
