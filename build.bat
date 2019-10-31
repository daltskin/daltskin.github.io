hugo

git add .
git commit -m 'new'
git push

echo jamied.me > daltskin.github.io/CNAME
cd daltskin.github.io
git add .
git commit -m 'new'
git push -f
