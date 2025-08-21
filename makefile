all: html pdf word

# RESUME_DIR specifies the directory that contains resume.md.
# If not provided, defaults to the repository root (current directory).
RESUME_DIR ?= .

# Determine input/output paths based on RESUME_DIR
ifeq ($(RESUME_DIR),.)
  INPUT := resume.md
  HTML_OUT := isaac_poole_resume.html
  PDF_OUT := isaac_poole_resume.pdf
  WORD_OUT := isaac_poole_resume.docx
  CSS := style.css
else
  INPUT := $(RESUME_DIR)/resume.md
  HTML_OUT := $(RESUME_DIR)/isaac_poole_resume.html
  PDF_OUT := $(RESUME_DIR)/isaac_poole_resume.pdf
  WORD_OUT := $(RESUME_DIR)/isaac_poole_resume.docx
  CSS := style.css
endif

html:
	pandoc $(INPUT) -f markdown -t html -s -o $(HTML_OUT) --css=$(CSS)

pdf:
	pandoc $(INPUT) -f markdown -t html -s -o $(PDF_OUT) --css=$(CSS)

word:
	pandoc $(INPUT) -o $(WORD_OUT) --css=$(CSS)
