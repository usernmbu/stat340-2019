all:
	make gitbook
	make pdf
	make epub
	make serve

gitbook:
	Rscript -e "bookdown::render_book('.', output_format = 'bookdown::gitbook')"
	
pdf:
	Rscript -e "bookdown::render_book('.', output_format = 'bookdown::pdf_book')"

epub:
	Rscript -e "bookdown::render_book('.', output_format = 'bookdown::epub_book')"

serve:
	browser-sync start --server --files 'docs/**/*' --startPath 'docs'

deploy:
	cd docs & git add . & git commit -am "site updated" & git push master origin
