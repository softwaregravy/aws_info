I decided to use blitz.io to see how I could measure progress. Each version I intend to loadtest.

v1.2
====

using the following blitz command string: -T 5000 -p 1-250:300 http://aws-data.herokuapp.com/aws_instances/index?region=us-east

We were solid up until right around 100 users. Last "good" datapoint (no timeouts) was at 110s
- 248ms response time 
- 68 hits/s (92 users)
- peak: 80 hits/s @ 120s (101 users) 236ms response time
- by 172 users our throughput drops to 0 (all requests timeout)
- newrelic shows the vast majority of latency as request queuing

Lets try page caching
