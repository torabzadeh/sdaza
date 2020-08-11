#!/bin/bash
#
# Convert Jupyter notebook files (in _jupyter folder) to markdown files (in _drafts folder).
#
# Arguments:
# $1 filename (excluding extension)
# Install:
# brew install gnu-sed
# Example:
# _scripts/convert.sh segregation

# Generate a filename with today's date.
filename=$(date +%Y-%m-%d)-$1

# Jupyter will put all the assets associated with the notebook in a folder with this naming convention.
foldername=$filename"_files"

# Do the conversion.
jupyter nbconvert ./_jupyter/$1.ipynb --to markdown --output-dir=./_posts --output=$filename --template=./_scripts/jekyll.tpl

# Move the images.
echo "Moving images..."
mv ./_posts/$foldername ./assets/img/

# Remove the now empty folder.
# rmdir ./_posts/$foldername

# Gets the title of the post
echo "What's the title of this post going to be?"
read ttl
gsed -ie "3 i title: \"$ttl\"" ./_posts/$filename.md
gsed -ie "7 i date: $(date +%Y-%m-%d)" ./_posts/$filename.md

echo "added title $ttl in line 3"
rm ./_posts/$filename.mde

# Go through the markdown file and rewrite image paths.
echo "Rewriting image paths..."
gsed -i.tmp -e "/assets/img/$foldername/" ./_posts/$filename.md
# 2018-02-08-segregation_files/2018-02-08-segregation_7_0.png
# sed -i.tmp -e "s/$foldername/\/images/g" ./_posts/$filename.md
# Remove backup file created by sed command.
rm ./_posts/$filename.md.tmp

# Check if the conversion has left a blank line at the top of the file.
# firstline=$(head -n 1 ./_posts/$filename.md)
# if [ "$firstline" = "" ]; then
#   # If it has, get rid of it.
#   tail -n +2 "./_posts/$filename.md" > "./_posts/$filename.tmp" && mv "./_posts/$filename.tmp" "./_posts/$filename.md"
# fi

echo "Done converting."
