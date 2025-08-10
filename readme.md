# To install this configuration:
git clone https://github.com/arabgb/neovim-configuration "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

# install nerd-font for nvim-web-divicons plugin:
https://github.com/ryanoasis/nerd-fonts
or to safe your time: use this:
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
fc-cache -fv

# Go to ~/.local/share/nvim/lazy/vim-prettier
Then do: npm install --legacy-peer-deps

# Install ripgrep app for telescope live_grep
https://github.com/BurntSushi/ripgrep#installation

# Telescope is require fd find, for more information 
https://github.com/sharkdp/fd?tab=readme-ov-file#installation

# jinja_lsp require cargo to work
sudo dnf install cargo # in fedora!

# js-doc require lehre , Go to : ~/.local/share/nvim/lazy/vim-jsdoc then:
make install
