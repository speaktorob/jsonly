all: jsonly

jsonly:
	gcc jsonly.c cJSON/cJSON.c -lm -o jsonly

install: jsonly
	mkdir -p /usr/local/bin
	cp jsonly /usr/local/bin

clean:
	rm jsonly

install-remote:
	ssh -p $(PORT) $(USER)@$(TARGET) sudo mkdir -m 0777 -p /usr/local/src/jsonly
	rsync --exclude=jsonly --exclude='.git' -e 'ssh -p $(PORT)' -r . $(USER)@$(TARGET):/usr/local/src/jsonly
	ssh -p $(PORT) $(USER)@$(TARGET) sudo make -C /usr/local/src/jsonly install
