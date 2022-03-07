function md --wraps='mkdir -pv'
  mkdir -pv $argv;
  and cd $argv;
end
