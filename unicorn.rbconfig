worker_processes 2
working_directory "/var/www/hungrybear"

timeout 30

# Specify path to socket unicorn listens to,
# we will use this in our nginx.conf later
listen "/var/www/hungrybear/tmp/sockets/unicorn_hungrybear.sock", :backlog => 64

# Set process id path
pid "/var/www/hungrybear/tmp/pids/unicorn_hungrybear.pid"

# Set log file paths
stderr_path "/var/www/hungrybear/logs/unicorn.stderr.log"
stdout_path "/var/www/hungrybear/logs/unicorn.stdout.log"

