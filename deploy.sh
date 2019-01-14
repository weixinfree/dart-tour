git checkout gh-pages
git clean -df
gitbook build
cp -r _book/* .
git commit -a -m "Publish Book"
git push