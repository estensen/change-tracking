# change-tracking
Efficiently track changes in a SQL database

[MS docs](https://docs.microsoft.com/en-us/sql/relational-databases/track-changes/about-change-tracking-sql-server?view=sql-server-ver15)

## Run SQL Server container
```
$ sudo docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=<YourStrong@Passw0rd>" \
   -p 1433:1433 --name sql1 \
   -d mcr.microsoft.com/mssql/server:2019-GA-ubuntu-16.04
$ sudo docker exec -it sql1 "bash"
```

