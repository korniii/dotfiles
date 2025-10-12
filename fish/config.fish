set fish_greeting ""

# Set TERM only if not inside Tmux
if not set -q TMUX
    set -gx TERM xterm-256color
end

fish_add_path ~/.config/scripts

bind \cf tmux-sessionizer

if status is-interactive
    # Commands to run in interactive sessions can go here
    fzf --fish | source
    atuin init fish | source
    starship init fish | source

    # source fiels in folder if the folder exists
    if test -d ~/.config/fish/work
        for file in ~/.config/fish/work/*.fish
            source $file
        end
    end
end

abbr -a ll "ls -la"
abbr v nvim
abbr g lazygit

abbr kk k9s
abbr kns kubens
abbr kctx kubectx

if type -q kubecolor
    abbr k kubecolor

    # Wrap kubecolor so it inherits kubectl completions
    function kubecolor --wraps kubectl
        command kubecolor $argv
    end
else
    abbr k kubectl
end

abbr tf terraform
abbr tfi "terraform init"
abbr tfp "terraform plan"
abbr tfa "terraform apply"

if type -q eza
    abbr -a l eza
    abbr -a ls eza
    abbr -a ll "eza -l"
    abbr -a lll "eza -la"
else
    abbr -a l ls
    abbr -a ll "ls -l"
    abbr -a lll "ls -lah"
end

if type -q bat
    abbr -a cat bat
end
