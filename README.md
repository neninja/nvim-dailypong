# Dailypong

## Installation

**Using Packer**

```lua
use {
    'neninja/nvim-dailypong',
    config = function()
      require('dailypong').setup()
    end,
}
```

## Usage

> `:help dailypong`

Open an `*.daily` file, write down your coworker's name and press enter when someone talks. The goal is to track who don't talk yet.
