-- ============================================================
-- SECTION 6: FORMATTING
-- conform.nvim setup and keymap
-- ============================================================
do
	-- [[ Formatting ]]
	vim.pack.add({ gh("stevearc/conform.nvim") })
	require("conform").setup({
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- You can specify filetypes to autoformat on save here:
			local enabled_filetypes = {
				-- lua = true,
				python = true,
			}
			if enabled_filetypes[vim.bo[bufnr].filetype] then
				return { timeout_ms = 500 }
			else
				return nil
			end
		end,
		default_format_opts = {
			lsp_format = "fallback", -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
		},
		-- You can also specify external formatters in here.
		formatters_by_ft = {
			-- rust = { 'rustfmt' },
			-- Conform can also run multiple formatters sequentially
			python = { "ruff_format", "ruff_organize_imports" },
			--
			-- You can use 'stop_after_first' to run the first available formatter from the list
			-- javascript = { "prettierd", "prettier", stop_after_first = true },
		},
	})

	vim.keymap.set({ "n", "v" }, "<leader>f", function()
		require("conform").format({ async = true })
	end, { desc = "[F]ormat buffer" })
end

-- 1. Pobranie wtyczek
vim.pack.add({ gh("windwp/nvim-autopairs") })
vim.pack.add({ gh("windwp/nvim-ts-autotag") })

-- 2. Konfiguracja Autopairs
-- Zamyka nawiasy, klamry i cudzysłowy.
require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})

-- 3. Konfiguracja Autotag
-- Zamyka i synchronizuje nazwy tagów HTML/Vue. Wymaga nvim-treesitter.
require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true, -- automatycznie dodaje tag zamykający
		enable_rename = true, -- zmienia nazwę tagu zamykającego przy edycji otwierającego
		enable_close_on_slash = true, -- zamyka tag po wpisaniu znaku '/'
	},
})
