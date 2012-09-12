all: allegro_tiled

install:
	cd build && make install

uninstall:
	cd build && make uninstall

allegro_tiled:
	@mkdir -p build
	-mkdir -p bin
	cd build && cmake $(CMAKE_FLAGS) ..
ifneq ($(MAKE),)
	cd build && $(MAKE)
else
	cd build && make
endif

clean:
	-cd build && make clean
	rm -rf build bin lib

.PHONY: doc
doc:
	@doxygen doc/Doxyfile
ifeq ($(UNAME),Darwin)
	@open doc/html/index.html
endif

.PHONY: test
test:
	@mkdir -p build
	@mkdir -p bin
	cd build && cmake $(CMAKE_FLAGS) ..
ifneq ($(MAKE),)
	cd build && $(MAKE)
else
	cd build && make
endif
	@if test -e bin/allegro_tiled_tests; then bin/allegro_tiled_tests; fi