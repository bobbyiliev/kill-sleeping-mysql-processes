# kill-sleeping-mysql-processes
This is a simple bash script that would kill any MySQL connections that have been sleeping longer than 'x' amount of time.

In most cases the sleeping MySQL connections should not really be bothering you, however in some cases the very large number of sleeping connections could exhaust all of the available server resources (RAM and CPU) and also you could also hit your max user connections.

You can use this as a temporary solution while you investigate the core issue on why your MySQL connections are not being closed and get your website patched.

You can also run it as a cron job, the cron would look something like this:

    * * * * * /path/to/the/script/mysql_sleeping.sh /dev/null 2>&1

For more information checkout this blog post here:

https://bobbyiliev.com/blog/killing-mysql-queries-sleeping-long-period-time/

Hope that this helps someone :)
