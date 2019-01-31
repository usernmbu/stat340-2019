all:
	make gitbook
	make pdf
	
gitbook:
	Rscript -e "bookdown::render_book('.', output_format = 'bookdown::gitbook')"
	
pdf:
	Rscript -e "bookdown::render_book('.', output_format = 'bookdown::pdf_book')"

clean:
	rm -rf docs

deploy:
	git add .
	git commit -am "site updated"
	git push master origin
