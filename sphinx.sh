if [[ $CI != "true" ]]; then
  echo "This is a github actions specific script"
  exit 1
fi
sudo apt update
pip install sphinx piccolo-theme sphinx_external_toc sphinx-book-theme myst-parser sphinx-prompt
sphinx-build docs build
