if status is-interactive
    set PATH ~/.local/bin $PATH
    starship init fish | source
    zoxide init fish | source
    abbr -a cd z
    abbr -a apti sudo apt install
    abbr -a tlmgr tlmgr --usermode
    abbr -a edfish 'nvim ~/.config/fish/config.fish'
    abbr -a ednvim 'nvim ~/.config/nvim/init.vim'
    abbr -a edkitty 'nvim ~/.config/kitty/kitty.conf'
    set -gx BW_SESSION "CMSZZeuMFz/hjGgnJUKbVWucj+bQqkbaX4XtFHWhrPqYisgYIb9TfF63yLd2GSadGYetB2FiOOVaPkrfJXz6pw=="
    abbr -a pykitty kitty --session ~/.config/kitty/python.session 
    abbr -a pipekittycat kitten @ --to unix:/tmp/mykitty send-text  --stdin
    abbr -a kittycat kitty -o allow_remote_control=yes --listen-on unix:/tmp/mykitty cat
end
