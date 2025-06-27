# Define variables
SOURCE_MD = informe.md
MODIFIED_MD = $(SOURCE_MD:.md=_with_r.md)
OUTPUT_PDF = $(SOURCE_MD:.md=.pdf)
RUBY_SCRIPT = embed_r.rb

# Default target
.PHONY: all
all: main

# Main operation depends on embed then compile
main: embed compile

# Embed operation: run Ruby script to include R code in Markdown
.PHONY: embed
embed: $(MODIFIED_MD)

$(MODIFIED_MD): $(SOURCE_MD) $(RUBY_SCRIPT)
	ruby $(RUBY_SCRIPT) $(SOURCE_MD)

# Compile operation: convert modified Markdown to PDF
.PHONY: compile
compile: $(OUTPUT_PDF)

$(OUTPUT_PDF): $(MODIFIED_MD)
#	pandoc $(MODIFIED_MD) -s -o $(OUTPUT_PDF)
	pandoc $(MODIFIED_MD) -f gfm -s -o $(OUTPUT_PDF) -V geometry:margin=1in --pdf-engine=xelatex

# Clean operation: remove PDF and modified Markdown files
.PHONY: clean
clean:
	rm -f $(MODIFIED_MD) $(OUTPUT_PDF)
