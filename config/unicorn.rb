worker_processes 2
timeout 30
listen "/tmp/unicorn.cupiturismo.sock"
 
root = "/home/cupiturismo/apps/cupiturismo/current"
 
working_directory root
 
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"