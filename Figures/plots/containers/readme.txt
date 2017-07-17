1/100 (1st hour) jobs from Borg

12 nodes

strategy binpack

Workers:
1 workers run_container with QUEUE: run_container
10 workers stop_container with QUEUE: stop_container
4 workers listener with QUEUE: listeners
1 worker generation with QUEUE: generation_cycle
5 workers migration with QUEUE: migrate
