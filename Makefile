# Makefile for source rpm
SPECFILE := env_check.spec
NAME := env_check
VERSION := 0.1

.PHONY: help
help:
%:
	@echo "Try make $@ or something like that"
	@exit 1

sources: clean
	tar -zcvf ${NAME}-${VERSION}.tar.gz ./*

source: sources
	if test ! -d SOURCES; then mkdir SOURCES; fi
	cp *.tar.gz SOURCES

srpm: source
	if test ! -d BUILD/SRPM; then mkdir -p BUILD/SRPM; fi
	mock --resultdir BUILD/SRPM --buildsrpm --spec ${SPECFILE} --sources SOURCES
rpm: srpm
	if test ! -d BUILD/RPM; then mkdir -p BUILD/RPM; fi
	mock --resultdir BUILD/RPM --rebuild BUILD/SRPM/${NAME}-*.src.rpm
clean ::
	@rm -fr SOURCES BUILD *.tar.gz

sandwich:
	@[ `id -u` -ne 0 ] && echo "What? Make it yourself." || echo Okay.

