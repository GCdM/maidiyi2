return {
	cmd = { "biome", "lsp-proxy" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"json",
		"jsonc",
	},
	root_dir = function(fname)
		return vim.fs.root(fname, { "biome.json", "biome.jsonc", "package.json", ".git" })
	end,
	single_file_support = false,
	settings = {},
}
