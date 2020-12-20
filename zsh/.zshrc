my_shdir=$XDG_CONFIG_HOME/zsh

# This order can be important. I like to make sure all the envars are
# set so subsequent functions etc can make use of them.
# Doing actions.sh early to avoid 3rd-party stuff overriding anything.
my_configs=(
  env_vars.sh
  plugins.zsh
  options.zsh
  theme.zsh
  aliases.zsh
  plugins.zsh
)

# Source all the Zsh-specific and sh-generic files.
for f in $my_configs; do
  [[ -f $my_shdir/$f ]] && . $my_shdir/$f
done
