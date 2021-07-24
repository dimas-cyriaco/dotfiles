function __nvm_use_on_cd --on-variable PWD --description 'Use Node.js version specified by project'
  if test -e .nvmrc
    nvm use
    return
  end
  
  if test -e .node-version
    nvm use (cat .node-version)
    return
  end
end
