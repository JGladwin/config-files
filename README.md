# Neovim config

## To use

- clone the repo in some location meant for neovim config. Here, I've kept it at *.config/nvim*. Let's call this location *WORK_DIR*
- store *WORK_DIR/lua/core/packer.lua* and all files in *WORK_DIR/after/plugin/* some other temporary location to initialize all init.lua files in the config first
- Initialize all files remaining by typing `:so` in command mode in neovim in *WORK_DIR/init.lua* file and executing it
- download plugin manager software and setup it up in plugin-manager-name.lua file. In this case, it is packer.lua
- bring packer.lua to *WORK_DIR/lua/core/packer.lua* and comment all external plugins and only the code for packer setup code should be present for installing it
- Initialize this file by typing `:so` in command mode in neovim in *WORK_DIR/lua/core/packer.lua* and run `:PackerSync` to install packer plugin manager
- Uncomment all commented code in *WORK_DIR/lua/core/packer.lua* and install it too
- Add all respective config files for external plugins present in *WORK_DIR/lua/core/packer.lua* to *WORK_DIR/after/plugin/*
- Run `PackerSync` in *WORK_DIR/lua/core/packer.lua* to finish the setup for one last time
- Run `:Mason` to invoke all lsps available and install according to requirement
