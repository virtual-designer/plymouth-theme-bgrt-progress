THEME_NAME = plymouth-theme-bgrt-progress
THEME_VERSION = 1.0.0

all: build

build:
	@echo "  MKDIR build" && mkdir build
	@echo "  COPY COPYING" && cp COPYING build
	@echo "  COPY README.md" && cp README.md build
	@echo "  COPY bgrt-progress.plymouth" && cp bgrt-progress.plymouth build
	@for file in static/*; do \
	echo "  COPY $$file"; \
	cp $$file build/; \
	done
	@cd build && bash ../gen-animation.sh
	@cd build && bash ../gen-throbber.sh

clean:
	@echo "  RM build" && rm -r build

dist: build
	@cp -r build $(THEME_NAME)-$(THEME_VERSION)
	@echo "  TAR $(THEME_NAME)-$(THEME_VERSION)" && tar -cvf $(THEME_NAME)-$(THEME_VERSION).tar.gz $(THEME_NAME)-$(THEME_VERSION)
	@rm -r $(THEME_NAME)-$(THEME_VERSION)

.PHONY: all clean dist
