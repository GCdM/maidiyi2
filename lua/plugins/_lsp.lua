-- LSP Configuration with nvim-lspconfig and Mason

return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>M", "<cmd>Mason<cr>", desc = "[*M*]ason" } },
		build = ":MasonUpdate",
		opts = {},
	},

	-- Bridge between Mason and native LSP (Neovim 0.11+)
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"jsonls",
				"yamlls",
				"bashls",
				-- 'pyright',
				-- 'rust_analyzer',
				-- 'gopls',
				-- 'clangd',
			},
			automatic_installation = true,
		},
	},

	-- Automatically install tools
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				-- LSP Servers
				"lua-language-server", -- Lua
				"typescript-language-server", -- TypeScript/JavaScript (for language features)
				"html-lsp", -- HTML
				"css-lsp", -- CSS
				"json-lsp", -- JSON
				"yaml-language-server", -- YAML
				"bash-language-server", -- Bash

				-- Formatters
				"biome", -- TypeScript/JavaScript (for linting & formatting)
				"stylua", -- Lua formatter
				"dprint", -- Fast markdown formatter

				-- Linters
				"shellcheck", -- Shell script linter
			},
			auto_update = false,
			run_on_start = true,
		},
	},

	-- Enhanced LSP UI
	{
		"j-hui/fidget.nvim",
		opts = {
			notification = {
				window = {
					winblend = 100,
				},
			},
		},
	},

	-- Formatting with conform.nvim
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				markdown = { "dprint" },

				typescript = { "biome" },
				javascript = { "biome" },
				typescriptreact = { "biome" },
				javascriptreact = { "biome" },

				json = { "biome" },
				jsonc = { "biome" },

				lua = { "stylua" },

				hyprland = { "hyprls" },
			},

			-- Custom formatter configurations
			formatters = {
				dprint = {
					condition = function(ctx)
						-- Only use dprint if dprint.json exists in project
						return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
					end,
				},
			},

			-- Format on save
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},

	-- Native LSP Configuration (Neovim 0.11+)
	{
		name = "native-lsp-config",
		dir = vim.fn.stdpath("config"),
		lazy = false,
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		keys = {
			{
				"<leader>ls",
				function()
					vim.print(vim.lsp.get_clients())
				end,
				desc = "[L]SP [S]ervers",
			},
			{
				"<leader>lb",
				function()
					vim.print(vim.lsp.get_clients({ bufnr = 0 }))
				end,
				desc = "[L]SP Attached to [B]uffer",
			},
		},
		config = function()
			-- Global LSP configuration that applies to all servers
			vim.lsp.config("*", {
				on_attach = function(client, bufnr)
					-- Enable completion triggered by <c-x><c-o>
					vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
					vim.api.nvim_set_option_value("tagfunc", "v:lua.vim.lsp.tagfunc", { buf = bufnr })

					-- Buffer local mappings
					local opts = { buffer = bufnr, silent = false }
					local optsWithDesc = function(desc)
						return vim.tbl_extend("force", opts, { desc = desc })
					end

					-- Navigation
					vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, optsWithDesc("[G]oto [S]ignature Help"))

					-- Actions
					vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, optsWithDesc("[C]ode [R]ename"))
					vim.keymap.set({ "n", "x" }, "<leader>F", function()
						require("conform").format({ async = true, lsp_fallback = true })
					end, optsWithDesc("[*F*]ormat Buffer"))
					vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, optsWithDesc("[C]ode [A]ction"))

					-- Note: 'K' is automatically mapped to vim.lsp.buf.hover() by Neovim

					-- Note: Diagnostic keymaps are defined globally in config/keymaps.lua
					-- to avoid duplication and provide consistent behavior across buffers

					-- Highlight the symbol and its references when holding the cursor
					if client.supports_method("textDocument/documentHighlight") then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = bufnr,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = bufnr,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,

				capabilities = vim.lsp.protocol.make_client_capabilities(),
			})

			-- Configure diagnostic display
			vim.diagnostic.config({
				virtual_text = {
					spacing = 4,
					source = "if_many",
					prefix = "●",
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "✘",
						[vim.diagnostic.severity.WARN] = "▲",
						[vim.diagnostic.severity.HINT] = "⚑",
						[vim.diagnostic.severity.INFO] = "»",
					},
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "if_many",
					header = "",
					prefix = "",
				},
			})

			-- Configure default border for all floating windows (Neovim 0.11+)
			-- This applies to LSP hover, signature help, and other floating windows
			vim.o.winborder = "rounded"

			-- Change the Diagnostic symbols in the sign column (gutter)
			local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "»" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- Setup language servers with custom configurations from /lsp/ directory
			local servers = {
				"lua_ls",
				"biome",
				"ts_ls",
				"html",
				"cssls",
				"jsonls",
				"yamlls",
				"bashls",
			}

			for _, server in ipairs(servers) do
				local config_path = "lsp." .. server
				local ok, custom_config = pcall(require, config_path)

				if ok then
					-- Use custom configuration
					vim.lsp.config(server, custom_config)
				else
					-- Use default configuration
					vim.lsp.config(server, {})
				end

				-- Enable the server
				vim.lsp.enable(server)
			end

			-- Create nvim-lspconfig aliases for familiarity (since we removed the plugin)
			vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {
				desc = "Show LSP information (alias to :checkhealth vim.lsp)",
			})

			vim.api.nvim_create_user_command("LspStart", function(opts)
				local server_name = opts.args
				if server_name == "" then
					vim.notify("LspStart: server name required", vim.log.levels.ERROR)
					return
				end
				vim.lsp.enable(server_name)
				vim.notify("Started LSP server: " .. server_name)
			end, {
				nargs = 1,
				desc = "Start the specified LSP server",
				complete = function()
					-- Return list of configured servers
					return { "lua_ls", "biome", "ts_ls", "html", "cssls", "jsonls", "yamlls", "bashls" }
				end,
			})

			vim.api.nvim_create_user_command("LspStop", function(opts)
				local client_name = opts.args
				local force = opts.bang

				if client_name == "" then
					-- Stop all clients attached to current buffer
					local clients = vim.lsp.get_clients({ bufnr = 0 })
					if #clients == 0 then
						vim.notify("No LSP clients attached to current buffer")
						return
					end
					for _, client in ipairs(clients) do
						client.stop(client, force)
						vim.notify("Stopped LSP client: " .. client.name)
					end
				else
					-- Stop specific client
					local clients = vim.lsp.get_clients({ name = client_name })
					if #clients == 0 then
						vim.notify("LSP client not found: " .. client_name, vim.log.levels.ERROR)
						return
					end
					for _, client in ipairs(clients) do
						client.stop(client, force)
						vim.notify("Stopped LSP client: " .. client.name)
					end
				end
			end, {
				nargs = "?",
				bang = true,
				desc = "Stop LSP client(s). Use ! to force stop.",
				complete = function()
					local clients = vim.lsp.get_clients()
					local names = {}
					for _, client in ipairs(clients) do
						table.insert(names, client.name)
					end
					return names
				end,
			})

			vim.api.nvim_create_user_command("LspRestart", function(opts)
				local client_name = opts.args

				if client_name == "" then
					-- Restart all clients
					local clients = vim.lsp.get_clients()
					if #clients == 0 then
						vim.notify("No active LSP clients to restart")
						return
					end
					for _, client in ipairs(clients) do
						local name = client.name
						client.stop(client)
						vim.defer_fn(function()
							vim.lsp.enable(name)
							vim.notify("Restarted LSP client: " .. name)
						end, 500)
					end
				else
					-- Restart specific client
					local clients = vim.lsp.get_clients({ name = client_name })
					if #clients == 0 then
						vim.notify("LSP client not found: " .. client_name, vim.log.levels.ERROR)
						return
					end
					for _, client in ipairs(clients) do
						client.stop(client)
						vim.defer_fn(function()
							vim.lsp.enable(client_name)
							vim.notify("Restarted LSP client: " .. client_name)
						end, 500)
					end
				end
			end, {
				nargs = "?",
				desc = "Restart LSP client(s)",
				complete = function()
					local clients = vim.lsp.get_clients()
					local names = {}
					for _, client in ipairs(clients) do
						table.insert(names, client.name)
					end
					return names
				end,
			})
		end,
	},
}
