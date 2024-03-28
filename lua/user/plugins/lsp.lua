return {
	--- Uncomment the two plugins below if you want to manage the language servers from neovim

	'neovim/nvim-lspconfig',
	dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { 'folke/neodev.nvim', opts = {} },
    }

	-- {'williamboman/mason.nvim'},
	-- {'williamboman/mason-lspconfig.nvim'},
	-- {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	-- {'neovim/nvim-lspconfig'},
	-- {'hrsh7th/cmp-nvim-lsp'},
	-- {'hrsh7th/nvim-cmp'},
	-- {'L3MON4D3/LuaSnip'},
}
