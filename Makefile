.PHONY: refresh build install build_dist release lint test clean

refresh: clean build install lint

ifeq ($(OS),Windows_NT)
    RM = cmd.exe /C del /F /Q
    RMDIR = cmd.exe /C rd /S /Q
    PATHSEP = \\
    PIPINSTALL = cmd.exe /C "FOR %%i in (dist\*.whl) DO python -m pip install --no-index --no-deps %%i"
else
    UNAME_S := $(shell uname -s 2>/dev/null || echo "unknown")
    ifeq ($(UNAME_S),Linux)
        RM = rm -f
        RMDIR = rm -rf
        PATHSEP = /
        PIPINSTALL = pip install dist/*.whl
    endif
    ifeq ($(UNAME_S),Darwin)
        RM = rm -f
        RMDIR = rm -rf
        PATHSEP = /
        PIPINSTALL = pip install dist/*.whl
    endif
endif

build:
	python setup.py build

install:
	python setup.py install

build_dist:
	make clean
	python setup.py sdist bdist_wheel
	$(PIPINSTALL)
	make test

release:
	python -m twine upload dist/*

test:
	pytest -v tests


path = $(subst /,$(strip $(PATHSEP)),$1)

clean:
	-$(RMDIR) $(call path,.pytest_cache)
	-$(RMDIR) $(call path,tests$(PATHSEP)__pycache__)
	-$(RMDIR) $(call path,src$(pycextensions)__pycache__)
	-$(RMDIR) $(call path,build)
	-$(RMDIR) $(call path,dist)
	-$(RMDIR) $(call path,pycextensions.egg-info)
	-$(RMDIR) $(call path,pycextensions.egg-info)
	-$(RMDIR) $(call path,src$(PATHSEP)pycextensions.egg-info)
	-$(RMDIR) $(call path,.coverage)
	-$(RMDIR) $(call path,coverage.xml)
	pip uninstall -y pycextensions
