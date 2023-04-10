[program:laravel-worker-%%QUEUE_NAME%%]
process_name=%(program_name)s_%(process_num)02d
command=php /app/artisan queue:%%QUEUE_MODE%% %%QUEUE_NAME%% --tries=%%RETRY_TIME%% --timeout=%%TIME_OUT%%
autostart=true
autorestart=true
numprocs=%%NUMBER_PROCESS%%
redirect_stderr=true
stdout_events_enabled=1
stdout_logfile=/dev/fd/1
stdout_logfile_maxbytes=0
stdout_capture_maxbytes=0
stderr_capture_maxbytes=0



