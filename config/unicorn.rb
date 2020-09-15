#listen 2007  # by default Unicorn listens on port 8080
worker_processes 6 # this should be >= nr_cpus
pid "/il_yanzhao/tmp/pids/unicorn.pid"
stderr_path "/il_yanzhao/log/unicorn_err.log"
stdout_path "/il_yanzhao/log/unicorn.log"
