function fish_greeting
    if not set -q TMUX
        fastfetch
    end
end
