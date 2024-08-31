return {
	"stevearc/conform.nvim",
	opts = {
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
			markdown = { "prettier" },
			["*"] = { "trim_whitespace", "codespell" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
	lazy = false,
}
