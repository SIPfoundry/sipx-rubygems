MODULES = \
        ruby-postgres-0.7.1 \
	ruby-dbi-0.1.1 \
	rubygem-file-tail-1.0.4  \
	rubygem-net-sftp-2.0.5 \
        rubygem-net-ssh-2.0.23

all: rpm


rpm-dir:
	@rm -rf `pwd`/RPMBUILD; \
	mkdir -p `pwd`/RPMBUILD/{BUILD,SOURCES,RPMS,SRPMS,SPECS}


rpm: rpm-dir
	for mod in ${MODULES}; do \
		rm -rf `pwd`/RPMBUILD/BUILD/*; \
		rm -rf `pwd`/RPMBUILD/DIST/*; \
		tar -czf `pwd`/RPMBUILD/DIST/$${mod}.tar.gz $${mod}; \
		rpmbuild -ta --define "%_topdir `pwd`/RPMBUILD" `pwd`/$${mod}.tar.gz; \
		mv `pwd`/RPMBUILD/RPMS/noarch/* `pwd`/RPMBUILD/RPMS/x86_64; \
	done




