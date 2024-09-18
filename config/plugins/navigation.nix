# Getting around REALLY FAST
{ pkgs, ... }:
{
  plugins = {
    telescope = {
      enable = true;
      extensions = {
        ui-select = {
          enable = true;
          settings = {
            codeactions = true;
          };
        };
        media-files = {
          enable = true;
          settings = {
            filetypes = [
              "png"
              "webp"
              "jpg"
              "jpeg"
              "mp4"
              "svg"
              "pdf"
              "mov"
              "mkv"
              "avi"
            ];
            find_cmd = "rg";
          };
          dependencies = {
            imageMagick.enable = true;
            pdftoppm.enable = true;
            ffmpegthumbnailer.enable = true;
          };
        };
      };
    };
    oil = {
      enable = true;
      # because combinePlugins.enable = true, the collision of `doc` is
      # unavoidable. this renames them.
      package = pkgs.vimPlugins.oil-nvim.overrideAttrs (oldAttrs: {
        postInstall =
          (oldAttrs.postInstall or "")
          + ''
            mv $out/doc/recipes.md $out/doc/oil_recipes.md
          '';
      });
      settings = {
        keymaps = {
          "J" = "actions.parent";
          "Q" = "actions.close";
          "<C-h>" = "actions.select_split";
          "<C-l>" = "actions.refresh";
          "<C-p>" = "actions.preview";
          "<C-s>" = "actions.select_vsplit";
          "<C-t>" = "actions.select_tab";
          "<CR>" = "actions.select";
          "K" = "actions.select";
          _ = "actions.open_cwd";
          "`" = "actions.cd";
          "g." = "actions.toggle_hidden";
          "g?" = "actions.show_help";
          "g\\" = "actions.toggle_trash";
          gs = "actions.change_sort";
          gx = "actions.open_external";
          "~" = "actions.tcd";
        };
        use_default_keymaps = false;
      };
    };
    harpoon = {
      enable = true;
      keymaps = {
        addFile = "<Leader>hh";
        cmdToggleQuickMenu = "<Leader>hm";
        gotoTerminal = {
          "1" = "<Leader>ht";
          "2" = "<Leader>h2";
          "3" = "<Leader>h3";
          "4" = "<Leader>h4";
        };
        navFile = {
          "1" = "<leader>j";
          "2" = "<leader>k";
          "3" = "<leader>l";
          "4" = "<leader>;";
          "5" = "<Leader>1";
          "6" = "<Leader>2";
          "7" = "<Leader>3";
          "8" = "<Leader>4";
        };
        navNext = "<Leader>]";
        navPrev = "<Leader>[";
        toggleQuickMenu = "<Leader>hk";
      };
    };
  };
}
