let
  colors = (import ../theme).colors;
  pkgs = inputs.nixpkgs;
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      gopls
      jdt-language-server
      lua-language-server
    ];
    plugins = with pkgs.vimPlugins; [
      {
        plugin = neo-tree-nvim;
        type = "lua";
        config = builtins.readFile ./_config/neo-tree.lua;
      }
      vim-nix
      vim-lastplace
      vim-helm
      nvim-ts-autotag
      nvim-ts-rainbow
      nvim-ts-context-commentstring
      nvim-treesitter-textobjects
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = builtins.readFile ./_config/treesitter.lua;
      }
/*
      {
        plugin = vim-table-mode;
        config = ''
          let g:table_mode_mappings_prefix = '<leader>r'
        '';
      }
*/
      {
        plugin = dracula-vim;
        config = ''
          let g:dracula_colorterm = 0
          colorscheme dracula
        '';
      }
      {
        plugin = telescope-nvim;
        config = ''
          nnoremap <leader>ff <cmd>Telescope find_files<cr>
          nnoremap <leader>fg <cmd>Telescope live_grep<cr>
          nnoremap <leader>fb <cmd>Telescope buffers<cr>
          nnoremap <leader>fh <cmd>Telescope help_tags<cr>
        '';
      }
      {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile ./_config/cmp.lua;
      }
      {
        plugin = neodev-nvim;
        type = "lua";
        config = ''
          require('neodev').setup({
            override = function(root_dir, library)
              if root_dir:find("config-nix") == 1 then
                library.enabled = true
                library.plugins = true
              end
            end,
          });
        '';
      }
      {
        plugin = luasnip;
      }
      {
        plugin = cmp_luasnip;
      }
      {
        plugin = cmp-nvim-lsp;
      }
      {
        plugin = friendly-snippets;
      }
      {
        plugin = nvim-web-devicons;
        type= "lua";
        config = ''
          require('nvim-web-devicons').setup()
        '';
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          local lspconfig = require "lspconfig"
          local util = require "lspconfig/util"

          lspconfig.gopls.setup {
            cmd = {"${pkgs.gopls}/bin/gopls", "serve"}
          }

          lspconfig.jdtls.setup {
            cmd = {"${pkgs.jdt-language-server}/bin/jdt-language-server", "-configuration", "${config.xdg.cacheHome}/jdtls/config", "-data", "${config.xdg.cacheHome}/jdtls/workspace"}
          }

          lspconfig.lua_ls.setup {
            cmd = {"${pkgs.lua-language-server}/bin/lua-language-server"}
          }

          lspconfig.nil_ls.setup {
            cmd = { "${pkgs.nil}/bin/nil" }
          }
        '' + builtins.readFile ./_config/lsp.lua;
      }
    ];
    extraConfig = ''
      set tabstop=4
      set shiftwidth=4
      set expandtab
      set number relativenumber

      lua << EOF
        local opts = { noremap=true, silent=true }
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

        vim.keymap.set('n', "<C-d>", "<C-d>zz", opts)
        vim.keymap.set('n', "<C-u>", "<C-u>zz", opts)
        vim.keymap.set('n', "n", "nzzzv", opts)
        vim.keymap.set('n', "N", "Nzzzv", opts)


        local signs = {
          { name = "DiagnosticSignError", text = "" },
          { name = "DiagnosticSignWarn", text = "" },
          { name = "DiagnosticSignHint", text = "" },
          { name = "DiagnosticSignInfo", text = "" },
          { name = "DapStopped", text = "" },
          { name = "DapBreakpoint", text = "" },
          { name = "DapBreakpointRejected", text = "", texthl = "DiagnosticError" },
          { name = "DapBreakpointCondition", text = "", texthl = "DiagnosticInfo" },
          { name = "DapLogPoint", text = ".>", texthl = "DiagnosticInfo" },
        }

        for _, sign in ipairs(signs) do
          if not sign.texthl then sign.texthl = sign.name end
          vim.fn.sign_define(sign.name, sign)
        end

        vim.diagnostic.config({
          virtual_text = true,
          signs = true,
          underline = true,
          update_in_insert = true,
          severity_sort = true,
          float = {
            focused = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
          },
        })
      EOF
    '';
  };
}
