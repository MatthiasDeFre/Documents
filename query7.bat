FOR /L %%A IN (1,1,100) DO (
  SET mysqlVar="C:\Program Files\MySQL\MySQL Server 5.7\bin\mysql.exe";
  mysql -u root -proot -D unidb < "D:\Downloads\ozt-dbperf-g17-master\ozt-dbperf-g17-master\experiment\data\query7.sql" > "test.txt"
)
pause;