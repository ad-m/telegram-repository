.PHONY: build_docker
build_docker:
	docker build -t apt-software .

.PHONY: build_pkg
build_pkg:
	docker run -v $$PWD:/src --workdir /src/build/pkg apt-software ls -lah .;
	docker run -v $$PWD:/src --workdir /src/build/pkg apt-software ./update.sh
	docker run -v $$PWD:/src --workdir /src/build/pkg apt-software dpkg-deb --build telegram;

.PHONY: copy
copy:
	docker run -v $$PWD:/src --workdir /src/ apt-software mv ./build/pkg/telegram.deb ./build/repo/dist/telegram.deb

.PHONY: build_repo
build_repo:
	rm -f ./build/repo/Packages* ./build/repo/InRelease* ./build/repo/Release*
	docker run -v $$PWD:/src --workdir /src/build/repo/ apt-software apt-ftparchive packages ./dist > ./build/repo/Packages;
	docker run -v $$PWD:/src --workdir /src/build/repo/ apt-software apt-ftparchive release . > ./build/repo/Release;
	gpg --default-key "$$GPG_KEYID" --yes --clearsign -o ./build/repo/InRelease ./build/repo/Release;
	gpg --default-key "$$GPG_KEYID" --yes -abs -o ./build/repo/Release.gpg ./build/repo/Release;
	gpg --export --armour "$$GPG_KEYID" > ./build/repo/publickey.txt;


.PHONY: clean
clean:
	sudo rm -r -f build/pkg/telegram/opt build/pkg/telegram.deb build/repo/InRelease build/repo/Packages build/repo/Packages.gz build/repo/Release build/repo/Release.gpg

.PHONY: test
test:
	docker run -v $$PWD:/src apt-software ./test.sh;
