if test -f ~/.config/fish/proxy.fish
    . ~/.config/fish/proxy.fish
end

fish_add_path ~/.config/scripts

bind \cf "tmux-sessionizer"

if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
end

abbr -a ll "ls -la"
abbr v "nvim"
abbr g "lazygit"
abbr k "k9s"

abbr tf "terraform"
abbr tfi "terraform init"
abbr tfp "terraform plan"
abbr tfa "terraform apply"

if type -q exa
	abbr -a l "exa"
	abbr -a ls "exa"
	abbr -a ll "exa -l"
	abbr -a lll "exa -la"
else 
	abbr -a l "ls"
	abbr -a ll "ls -l"
	abbr -a lll "ls -la"
end

if type -q bat
	abbr -a cat "bat"
end
