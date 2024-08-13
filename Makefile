DB_URL=postgresql://postgres:secret@localhost:15432/bulter?sslmode=disable

dbdatafolder:
	mkdir "./DatabaseData"

dbmigrationfolder:
	mkdir "./DatabaseMigration"

network:
	docker network create bulter-network

postgres:
	docker run --name postgresdb --network bulter-network -p 15432:5432 -v ${PWD}/DatabaseFolder:/var/lib/postgresql/data -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=secret -d postgres:16.4

createdb:
	docker exec -it postgresdb createdb --username=postgres --owner=postgres bulter

dropdb:
	docker exec -it postgresdb dropdb bulter

.PHONY: dbdatafolder dbmigrationfolder network postgres createdb dropdb