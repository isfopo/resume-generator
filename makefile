all: pdf word

pdf:
	pandoc resume.md -f markdown -t html -s -o isaac_poole_resume.pdf \
	    --css=style.css

word:
	pandoc resume.md -o isaac_poole_resume.docx \
		--css=style.css
