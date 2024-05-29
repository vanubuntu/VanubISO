if [[ $CI != "true" ]]; then
  echo "This is a github actions specific script"
  exit 1
fi
sudo apt update
sudo apt install python3-sphinx
sphinx-build docs build
