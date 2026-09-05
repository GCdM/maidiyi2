return {
	cmd = { "bunx", "biome", "lsp-proxy" },
	-- -- Use project's biome; fallback to Mason managed biome
	-- cmd = function()
	-- 	local local_biome = vim.fn.getcwd() .. "/node_modules/.bin/biome"
	-- 	if vim.fn.executable(local_biome) == 1 then
	-- 		return { local_biome, "lsp-proxy" }
	-- 	end
	-- 	return { vim.fn.exepath("biome"), "lsp-proxy" } -- mason fallback
	-- end,

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
	root_markers = { "biome.json", "biome.jsonc", "package.json", ".git" },
	single_file_support = true,
	settings = {
		linter = {
			enabled = true,
		},
		formatter = {
			enabled = true,
			formatWithErrors = true,
		},
	},
}
