{inputs, ...}:

let
  pkgs = inputs.nixpkgs;
  unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;

  nvim-spell-de-utf8-dictionary = builtins.fetchurl {
    url = "http://ftp.vim.org/vim/runtime/spell/de.utf-8.spl";
    sha256 = "1ld3hgv1kpdrl4fjc1wwxgk4v74k8lmbkpi1x7dnr19rldz11ivk";
  };

  nvim-spell-de-utf8-suggestions = builtins.fetchurl {
    url = "http://ftp.vim.org/vim/runtime/spell/de.utf-8.sug";
    sha256 = "0j592ibsias7prm1r3dsz7la04ss5bmsba6l1kv9xn3353wyrl0k";
  };

  nvim-spell-de-latin1-dictionary = builtins.fetchurl {
    url = "http://ftp.vim.org/vim/runtime/spell/de.latin1.spl";
    sha256 = "0hn303snzwmzf6fabfk777cgnpqdvqs4p6py6jjm58hdqgwm9rw9";
  };

  nvim-spell-de-latin1-suggestions = builtins.fetchurl {
    url = "http://ftp.vim.org/vim/runtime/spell/de.latin1.sug";
    sha256 = "0mz07d0a68fhxl9vmy1548vnbayvwv1pc24zhva9klgi84gssgwm";
  };

  nushell-treesitter-highlights = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/nushell/tree-sitter-nu/main/queries/nu/highlights.scm";
    sha256 = "04ddx7sdcigc0yn39air6sd3v7sknkyl4y72357ndkjc3i9jhbxc";
  };

  nushell-treesitter-indents = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/nushell/tree-sitter-nu/main/queries/nu/indents.scm";
    sha256 = "14c8ifk92j7z2z2zrpy0zbqa6hq0ysh5rimbispgawkkyv68xgbz";
  };

  nushell-treesitter-injections = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/nushell/tree-sitter-nu/main/queries/nu/injections.scm";
    sha256 = "15kh9nb2k2672yzxzydgv9v2aaa6znyq9vcpxkqs6qmzmxl2zhh8";
  };
in {
  home.file."${config.xdg.configHome}/nvim/spell/de.utf-8.spl".source = nvim-spell-de-utf8-dictionary;
  home.file."${config.xdg.configHome}/nvim/spell/de.utf-8.sug".source = nvim-spell-de-utf8-suggestions;
  home.file."${config.xdg.configHome}/nvim/spell/de.latin1.spl".source = nvim-spell-de-latin1-dictionary;
  home.file."${config.xdg.configHome}/nvim/spell/de.latin1.sug".source = nvim-spell-de-latin1-suggestions;

  home.file."${config.xdg.configHome}/nvim/queries/nu/highlights.scm".source = nushell-treesitter-highlights;
  home.file."${config.xdg.configHome}/nvim/queries/nu/indents.scm".source = nushell-treesitter-indents;
  home.file."${config.xdg.configHome}/nvim/queries/nu/injections.scm".source = nushell-treesitter-injections;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraLuaConfig = builtins.readFile ./_config/extra.lua;

    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-helm
      Jenkinsfile-vim-syntax

      vim-lastplace
      vim-sleuth

      # Treesitter
      rainbow-delimiters-nvim
      nvim-ts-autotag
      nvim-ts-context-commentstring
      nvim-treesitter-textobjects
      {
        plugin = (nvim-treesitter.withPlugins (_: nvim-treesitter.allGrammars ++ [
          pkgs.tree-sitter.builtGrammars.tree-sitter-nu
        ]));
        type = "lua";
        config = builtins.readFile ./_config/treesitter.lua;
      }

      # Version Control and Local History
      {
        plugin = diffview-nvim;
      }
      {
        plugin = unstable.vimPlugins.neogit;
        type = "lua";
        config = ''
          require('neogit').setup {}
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
        plugin = undotree;
        config = ''
          nnoremap <F5> :UndotreeToggle<CR>

          if has("persistent_undo")
            let target_path = expand('~/.undodir')

             " create the directory and any parent directories
             " if the location does not exist.
             if !isdirectory(target_path)
                 call mkdir(target_path, "p", 0700)
             endif

             let &undodir=target_path
             set undofile
          endif
        '';
      }

      # Productivity and Tools
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
        type = "lua";
        config = builtins.readFile ./_config/telescope.lua;
      }
      {
        plugin = telescope-ui-select-nvim;
        type = "lua";
      }
      {
        plugin = neo-tree-nvim;
        type = "lua";
        config = builtins.readFile ./_config/neo-tree.lua;
      }
      {
        plugin = unstable.vimPlugins.neorg;
        type = "lua";
        config = builtins.readFile ./_config/neorg.lua;
      }
      {
        plugin = vim-table-mode;
        config = ''
          let g:table_mode_map_prefix = '<leader>r'
        '';
      }
      {
        plugin = unstable.vimPlugins.harpoon2;
        type = "lua";
        config = ''
          local harpoon = require("harpoon")
          harpoon:setup()

          vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
          vim.keymap.set("n", "<leader>hs", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

          vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
          vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
          vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
          vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
          vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)

          -- Toggle previous & next buffers stored within Harpoon list
          vim.keymap.set("n", "<C-h>", function() harpoon:list():prev() end)
          vim.keymap.set("n", "<C-l>", function() harpoon:list():next() end)
        '';
      }
      {
        plugin = zen-mode-nvim;
        type = "lua";
        config = ''
          require("zen-mode").setup {
            plugins = {
              alacritty = {
                enabled = true,
                font = "32"
              }
            }
          }
        '';
      }

      # Appearance
      {
      plugin = nvim-web-devicons;
      type= "lua";
      config = ''
        require('nvim-web-devicons').setup()
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
        plugin = nvim-notify;
        type = "lua";
        config = ''
          require("notify").setup({
            background_colour = "#000000",
            stages = "static", -- no fancy animations/transitions to avoid cursor flickering
          })
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

      # LSP, Completion, Formatting, Linting
      {
        plugin = conform-nvim;
        type = "lua";
        config = ''
          require("conform").setup({
            format_on_save = {
              timout_ms = 500,
              lsp_fallback = true,
            },
            formatters = {
              --yamlfix = { command = "${pkgs.yamlfix}/bin/yamlfix" },
            },
            formatters_by_ft = {
              yaml = { "yamlfix" },
              go = { "gofmt" },
            },
          })
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
              if root_dir:find("config%-nix") then
                library.enabled = true
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

          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true

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

          lspconfig.tsserver.setup {
            capabilities = capabilities,
            cmd = { "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server", "--stdio" }
          }
          lspconfig.html.setup {
            capabilities = capabilities,
            cmd = { "${pkgs.nodePackages.vscode-html-languageserver-bin}/bin/html-languageserver", "--stdio" },
          }
          lspconfig.cssls.setup {
            capabilities = capabilities,
            cmd = { "${pkgs.nodePackages.vscode-css-languageserver-bin}/bin/css-languageserver", "--stdio" },
          }
          lspconfig.jsonls.setup {
            capabilities = capabilities,
            cmd = { "${pkgs.nodePackages.vscode-json-languageserver-bin}/bin/json-languageserver", "--stdio" },
          }
          lspconfig.nushell.setup {
            capabilities = capabilities,
            cmd = { "${pkgs.nushell}/bin/nu", "--lsp" },
          }
        '' + builtins.readFile ./_config/lsp.lua;
      }

      # Debugging
      {
        plugin = nvim-dap-ui;
        type = "lua";
      }
      {
        plugin = nvim-dap-virtual-text;
        type = "lua";
      }
      {
        plugin = nvim-dap-go;
        type = "lua";
      }
      {
        plugin = nvim-dap;
        type = "lua";
        config = builtins.readFile ./_config/dap.lua;
      }
    ];
  };
}
