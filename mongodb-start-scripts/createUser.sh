#!/bin/ash
echo 'Creating user for ${MONGO_INITDB_DATABASE}'
mongo --eval "
	db = db.getSiblingDB('${MONGO_INITDB_DATABASE}');
	db.createUser({
		user:  '$MONGODB_USERNAME',
		pwd: '$MONGODB_PASSWORD',
		roles: [{
			role: 'readWrite',
			db: '$MONGO_INITDB_DATABASE'
		}]
	});
"