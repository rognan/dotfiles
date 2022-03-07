if status is-interactive
    # Commands to run in interactive sessions can go here
end

if command -q brew
  if command -q asdf
    source (brew --prefix asdf)/libexec/asdf.fish
  end
end

