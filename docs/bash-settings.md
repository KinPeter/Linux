# Bash settings

## Customize prompt with git and make it two lines

Look for the below snippet in `.bashrc`

```bash
if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ' 
else 
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ ' 
fi
```

And replace it as here:

```bash
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
get_git_status() {
  local stts=$(git status -s 2> /dev/null | wc -l)
  if [[ $stts -ne 0 ]]; then
    echo "(!$stts)"
  fi
}
if [ "$color_prompt" = yes ]; then
  PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\] $(parse_git_branch) \[\033[01;33m\]$(get_git_status)\[\033[00m\]\n\$ '
else
  PS1='\n${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch) $(get_git_status)\n\$ '
fi
```

Notice the `\n`-s added to the beginnings and before the end of the prompt \(`\$`\), that will put the prompt to a new line.

## Change the default starting directory \(WSL\)

```bash
# set directory to HOME if by default it is the Windows folder
if [[ $(pwd) =~ /mnt/c/WINDOWS/(S|s)ystem32 ]]; then
  cd ~
fi
```