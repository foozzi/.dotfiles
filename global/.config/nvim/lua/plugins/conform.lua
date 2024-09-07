return {
	"stevearc/conform.nvim",
	opts = {
		log_level = vim.log.levels.DEBUG,
		formatters = {
			prettier_markdown = {
				command = "prettier",
				args = { "--stdin-filepath", "$FILENAME", "--config", os.getenv("HOME") .. "/.prettierrc.yaml" },
				-- stdin = true,
				-- options = {
				-- 	ext_parsers = {
				-- 		jrnl = { "markdown" },
				-- 	},
				-- },
			},
		},
		icon = "", --'▎',
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format", "ruff_fix", "isort" },
			javascript = { "biome" },
			typescript = { "biome" },
			javascriptreact = { "biome" },
			typescriptreact = { "biome" },
			json = { "biome" },
			sh = { "shfmt" },
			markdown = { "prettier_markdown" },
			jrnl = { "prettier_markdown" },
			["*"] = { "trim_whitespace", "codespell" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
	lazy = false,
}
