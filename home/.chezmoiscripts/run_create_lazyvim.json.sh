#!/bin/sh
if [ ! -f ~/.config/nvim/lazyvim.json ] ; then
  mkdir -p ~/.config/nvim
  cat <<EOF > ~/.config/nvim/lazyvim.json
{
  "extras": [
    "lazyvim.plugins.extras.coding.mini-surround",
    "lazyvim.plugins.extras.coding.yanky",
    "lazyvim.plugins.extras.editor.dial",
    "lazyvim.plugins.extras.editor.harpoon2",
    "lazyvim.plugins.extras.editor.inc-rename",
    "lazyvim.plugins.extras.editor.mini-files",
    "lazyvim.plugins.extras.lang.git",
    "lazyvim.plugins.extras.lang.markdown",
    "lazyvim.plugins.extras.lang.toml",
    "lazyvim.plugins.extras.lang.yaml",
    "lazyvim.plugins.extras.ui.alpha",
    "lazyvim.plugins.extras.util.dot",
    "lazyvim.plugins.extras.util.mini-hipatterns",
  ],
  "news": {
    "NEWS.md": "10960"
  },
  "version": 7
}
EOF
fi
