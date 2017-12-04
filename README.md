# Docker Swarm whoami Demo mit Vagrant

Eine einfache Vagrant Konfiguration für einen lokalen Docker Swarm Cluster mit Portainer, Visualizer und whoami Dienst. Basierend auf https://github.com/tdi/vagrant-docker-swarm.

## Software Vorraussetzungen

Die folgende Software wird benötigt:

* [VirtualBox](https://www.virtualbox.org/) als Virtualisierungs Provider.
* [Vagrant](https://www.vagrantup.com/downloads.html) zum provisoning der Swarm Nodes.

### Optional

 * [Cygwin](https://www.cygwin.com/) Windows Bash mit Curl

## Verwendete Container

Der Cluster wird zusammen mit einem privaten virtuellen NAT Netzwerk erstellt. Die Container werden per Port Weiterleitung an den Host freigegeben.

* grafische Administrations-Oberfläche: [Portainer](https://hub.docker.com/r/portainer/portainer/) - http://localhost:9000
* Cluster visualisierung: [Visualizer](https://hub.docker.com/r/dockersamples/visualizer/) - http://localhost:8080
* Beispiel Dienst: [jwilder/whoami](https://hub.docker.com/r/jwilder/whoami/) - http://localhost:8000

## Befehle

### Cluster aufsetzen und starten

Nodes treten dem Cluster automatisch bei.

````cmd
.\up-vbox.cmd
````

### Nodes auflisten

````cmd
docker node ls
````

### laufende Service Container ausgeben

````cmd
docker service ps
````

### Whoami Service bereitstellen

````cmd
docker service create --name whoami --replicas 3 --publish 8000:8000 --detach=true jwilder/whoami
````

### HTTP Anfrage in Dauerschleife

````bash
while true; do curl localhost:8000; sleep 1; done
````

### worker1 herunterfahren zur Fehlersimulation

````cmd
vagrant suspend worker1
````

### worker1 wiederherstellen

````cmd
vagrant resume worker1
````