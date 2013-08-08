#!/bin/sh
# https://github.com/bvandenbos/resque-scheduler
# http://blog.togo.io/how-to/resque-scheduler/
# https://github.com/resque/resque
# http://tommy.chheng.com/2010/10/26/how-to-run-background-processes-using-resqueredis-in-a-ruby-on-rails-app/
# http://hafizbadrie.wordpress.com/2011/03/23/implementing-resqueredis-on-rails-3/
# http://rubylearning.com/blog/2010/11/08/do-you-know-resque/
rake resque:scheduler
sleep 10
COUNT=5 QUEUE=* rake resque:workers
./src/redis-server
echo "The IP to check this fucking shit http://0.0.0.0:5678/overview"