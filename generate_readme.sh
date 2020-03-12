jupyter nbconvert README.ipynb --to html
pandoc -o README.md README.html
rm README.html
