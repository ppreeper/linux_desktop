#!/bin/bash
apm install atom-beautify
apm install atom-zurb-foundation
apm install autocomplete-html-entities
apm install autocomplete-java
apm install autocomplete-json
apm install autocomplete-python
apm install autocomplete-xml
apm install busy-signal
apm install color-picker
apm install css-snippets
apm install emmet
apm install file-icons
apm install go-debug
apm install go-plus
apm install go-signature-statusbar
apm install hyperclick
apm install intentions
apm install javascript-snippets
apm install linter
apm install linter-flake8
apm install linter-golinter
apm install linter-sass-lint
apm install linter-ui-default
apm install merge-conflicts
apm install minimap-pigments
apm install pigments
apm install print-atom
apm install project-manager
apm install symbols-tree-view
apm install terminal-plus


echo '
  "autocomplete-python":
    extraPaths: "$HOME/.virtualenvs/$PROJECT_NAME/lib/python2.7/site-packages;$HOME/.virtualenvs/$PROJECT_NAME/lib/python3.5/site-packages"
    pythonPaths: "$HOME/.virtualenvs/$PROJECT_NAME/bin/python;$PROJECT/venv/bin/python;/usr/bin/python"
' >> $HOME/.atom/config.cson
