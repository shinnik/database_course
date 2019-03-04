load data infile '/private/var/lib/mysql-files/payments.csv' into table testdb.payments fields terminated by ','lines terminated by '\n';

load data infile '/private/var/lib/mysql-files/sessions.csv' into table testdb.sessions fields terminated by ','lines terminated by '\n';

load data infile '/private/var/lib/mysql-files/users.csv' into table testdb.users fields terminated by ','lines terminated by '\n';