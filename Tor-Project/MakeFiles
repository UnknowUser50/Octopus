all:

clean:

install:
	apt update
	apt install -y zenity  tor nyx 
	mkdir -p $(DESTDIR)/etc/anonsurf/
	mkdir -p $(DESTDIR)/etc/tor/
	mkdir -p $(DESTDIR)/etc/init.d/
	mkdir -p $(DESTDIR)/usr/bin/
	mkdir -p $(DESTDIR)/usr/share/applications/
	mkdir -p $(DESTDIR)/usr/share/parrot-menu/applications/
	mkdir -p $(DESTDIR)/lib/systemd/system/
	cp onion.pac $(DESTDIR)/etc/anonsurf/onion.pac
	ln -s /etc/anonsurf/onion.pac $(DESTDIR)/etc/tor/onion.pac
	cp torrc $(DESTDIR)/etc/anonsurf/torrc
	cp torrc $(DESTDIR)/etc/tor
	cp anondaemon $(DESTDIR)/etc/anonsurf/
	cp services/anonsurfd.service $(DESTDIR)/lib/systemd/system/
	# cp services/anonsurfd $(DESTDIR)/etc/init.d/
	cp anonsurf $(DESTDIR)/usr/bin/

	chown root:root $(DESTDIR)/usr/bin/anonsurf
	chmod 775 $(DESTDIR)/usr/bin/anonsurf
	ln -s /usr/bin/anonsurf $(DESTDIR)/usr/bin/anon
	chown root:root $(DESTDIR)/etc/anonsurf -R
	chmod 644 $(DESTDIR)/etc/anonsurf -R
	chmod 775 $(DESTDIR)/etc/anonsurf/anondaemon
	touch /etc/anonsurf/conky_msg
	systemctl disable tor
