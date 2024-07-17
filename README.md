# Vim-Setup

- Open terminal and verify if vim is installed by typing `vim --version`
- If not installed, install vim by typing `sudo apt-get install vim`
- Install Plug by typing `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
- Open your .vimrc file by typing `vim ~/.vimrc`
- Copy and paste the content of the .vimrc file in this repository into your .vimrc file
- Save and exit the file by typing `:wq`
- Open your .vimrc file by typing `vim ~/.vimrc` again
    - type `:PlugInstall` to install all the plugins
- Enter the following commands in the terminal to install coc.nvim, otherwise you'll get an error everytime you open vim
    - `~/.vim/plugged/coc.nvim`
    - `npm ci`
- Enter the following commands in the terminal to enable tagBar, otherwise it won't work
    - `brew unlink ctags`
    - `brew install universal-ctags`

This is a simple vim setup that I use for my daily coding. Feel free to use it and modify it to your liking. 

p.s. I'm not a vim expert, so if you have any suggestions, feel free to let me know. Also, I'd recommend you to learn the basics of vim before using this setup, there's lots of resources online to help you with that. Enjoy!
