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
- memory was pretty constant at 368-373MB 

Ideas for improving performance:
- asset/partial-page caching
- whole action caching
- more puma processes (looks like we still have some memory to spare)

v1.3
====

For this version I introduced action caching. It seems to have made a very significant impact.


We were solid up until 100 users again. Last "good" datapoint was at 120s 
- 268ms response time
- 233 hits/s @ 296ms (243 users) 173ms response time
- scaled up strongly to 130 hits/s, then suffered degredation. Actually had a 5s window where throughput dropped to 0, then performed strongly to north of 200 hits/s
- newrelic shows basically all the latency as request queueing
- memory held steady at 381

This is very exciting though, because unlike the previous test, the system suffered a bit of degredation, but then adapted. Maybe the JVM did optimization for us? Maybe caching got better? Point is, we had some great datapoints further on.


