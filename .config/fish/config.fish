if status is-interactive
    set -gx --prepend PATH ~/.cargo/bin
    # Initialize zoxide as `j` and `ji`
    zoxide init fish --cmd j --no-aliases | source
end
