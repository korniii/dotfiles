. ~/.config/fish/config.shortcuts

if test -f ~/.config/fish/proxy.fish
    . ~/.config/fish/proxy.fish
end

fish_add_path ~/.config/scripts

bind \cf "tmux-sessionizer"

# if status is-interactive
    # Commands to run in interactive sessions can go here
# end

