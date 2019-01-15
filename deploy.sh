function print() {
    echo ""
    echo $1
    echo ""
}

print "1. cleanup gh-pages"

git branch -d gh-pages
git checkout -b gh-pages
git clean -df
git merge master

print "2. build and publish"

gitbook build
cp -r _book/* .
git add .
git commit -a -m "Publish Book"
git push -f -u origin gh-pages

print "3. goback and clean up"

git checkout master
git clean -df