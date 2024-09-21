# Quandary for Neovim

A Neovim plugin that provides language support for [Quandary](https://github.com/mdbond/Quandary-Public), including syntax highlighting.

## Features

- Syntax highlighting for Quandary files (`.q` and `.qet` extensions)
- Automatic filetype detection

## Installation

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use 'yourusername/quandary.nvim'
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'yourusername/quandary.nvim'
```

## Configuration

Add the following to your `init.lua`:

```lua
require('quandary')
```

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
