{inputs, ...}:

let
  pkgs = inputs.nixpkgs;
  unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
  language-servers = inputs.language-servers.packages.x86_64-linux;
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
        plugin = unstable.vimPlugins.neorg;
        type = "lua";
        config = ''
          require('neorg').setup {
            load = {
              ["core.defaults"] = {},
              ["core.dirman"] = {
                config = {
                  workspaces = {
                    work = "~/notes/work",
                    home = "~/notes/home"
                  }
                }
              },
              ["core.completion"] = {
                config = {
                  engine = "nvim-cmp",
                  name = "[Neorg]"
                }
              },
              ["core.concealer"] = {
                config = {
                  folds = true,
                  icon_preset = "basic",
                  init_open_folds = "auto"
                }
              }
            }
          }
        '';
      }
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = builtins.readFile ./_config/treesitter.lua;
      }
      {
        plugin = vim-table-mode;
        config = ''
          let g:table_mode_map_prefix = '<leader>r'
        '';
      }
      {
      plugin = nvim-web-devicons;
      type= "lua";
      config = ''
        require('nvim-web-devicons').setup()
      '';
      }
      {
        plugin = gitsigns-nvim;
        type= "lua";
        config = ''
          require('gitsigns').setup()
        '';
      }
      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = ''
          require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
            term_colors = true
          })
          
          vim.cmd.colorscheme "catppuccin"
        '';
      }
      {
        plugin = unstable.vimPlugins.indent-blankline-nvim;
        type = "lua";
        config = ''
          local config = require("ibl.config").default_config
          config.indent.tab_char = config.indent.char
          require("ibl").setup()
        '';
      }
      {
        plugin = dracula-nvim;
      }
      {
        plugin = noice-nvim;
        type = "lua";
        config = ''
          require('noice').setup {
            lsp = {
              override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
              },
            },
            presets = {
              -- bottom_search = true, 
              command_palette = true,
            }
          }
          
          vim.keymap.set('n', '<leader>tm', '<cmd>Noice telescope<cr>', { noremap = true, silent = true })
        '';
      }
      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
          vim.opt.showmode = false,
          require('lualine').setup {
            options = {
                theme = "catppuccin",
            },
            sections = {
              lualine_x = {
                {
                  require("noice").api.statusline.mode.get,
                  cond = require("noice").api.statusline.mode.has,
                }
              }
            }
          }
        '';
      }
      {
        plugin = nvim-notify;
        type = "lua";
        config = ''
          require("notify").setup({
            background_colour = "#000000",
          })
        '';
      }
      {
        plugin = FTerm-nvim;
        type = "lua";
        config = ''
          require('FTerm').setup {}
          vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
          vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
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
              if root_dir:find("config-nix", nil, true) then
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

          lspconfig.helm_ls.setup {
            filetypes = { "helm" },
            cmd = { "${unstable.helm-ls}/bin/helm_ls", "serve" },
            root_dir = function(fname)
              return util.root_pattern('Chart.yaml')(fname)
            end,
          }

          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true
          lspconfig.html.setup {
            capabilities = capabilities,
            cmd = { "${language-servers.vscode-langservers-extracted}/bin/vscode-html-language-server", "--stdio" },
          }
          lspconfig.cssls.setup {
            capabilities = capabilities,
            cmd = { "${language-servers.vscode-langservers-extracted}/bin/vscode-css-language-server", "--stdio" },
          }
          lspconfig.jsonls.setup {
            capabilities = capabilities,
            cmd = { "${language-servers.vscode-langservers-extracted}/bin/vscode-json-language-server", "--stdio" },
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

        vim.opt.list = true
        vim.opt.listchars = {
          space = "⋅",
          eol = "↴",
          tab = "→ ",
          trail = "•",
          extends = "❯",
          precedes = "❮",
          nbsp = "ﰸ",
        }

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
