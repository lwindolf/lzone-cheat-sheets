This is about an IT ops incident reponse method called "OPA" short for

1. Oberservation
2. Presumptions
3. Actions

Please note, that I do not know whom to credit for this. If you know please let me know or create a PR!

## Background

The philosophy of the method is to do scientific falsification (see Karl Popper). Actions are more or
less experiments to prove/disprove presumptions. The assumption is that the reason why you cannot solve 
the current incident is that your presumptions are lacking and switching to the OPA methods helps you to 
fix this and solve the incident.

## When to use it?

In general this is a complementary method that you use when your normal incident playbook does not work.
I suggest to always start with the normal incident response playbook and only later on to switch to this.
Here are some criteria for the switch:

- In the short interval incident sync meeting everyone is spechless about what to do
- There is a lot of infighting about what to do
- You executed you incident handling reponse playbook without any good results

## How to "do" OPA?

Any longer running incident should have regular sync meetings. OPA means you simple run
those periodic incident meetings differently. Have a meeting every 15min to 1h depending 
on your business, urgency and time needed to execute action points.

Start OPA by

1. Invite any missing experts by phone/chat to the next incident meeting
2. (Optional) Get buy-in by the responsible manager for the method
3. Nominate a moderator / organizer
4. Setting up a whiteboard (physical if possible)
5. Explain why you are switching to OPA and explain by simply doing it
6. Add the 3 sections "Observations", "Presumptions", "Actions"

Hold the meeting by doing these steps

1. Updating the "Observations"
   - add all not yet listed known possibly relevant facts
   - cross out incorrect/unrelated stuff
   - ensure there are only facts in "Observations" never "Presumptions"

2. Updating the "Actions" and "Presumptions"
   - starting with the 2nd meeting 
     - cross out all falsified presumptions and add a result marker (true/false)
     - cross out all executed actions and add observations for the results
   - add new actions and presumptions
     - every action should prove/falsify a presumption
     - add the presumption number to the action

3. Plan next iteration
   - select actions to perform, assign responsible people
   - set the next meeting time

General hints
- during OPA
  - stop people from immediately working/checking stuff during the OPA meeting
  - train them to follow the OPA distinctions
  - allow for contradicting "Presumptions", you falsify them anyway, showing the contradiction
    can help laying open how we have different understanding of the system
  - allow and encourage for "Observations" not matching current "Presumptions" and "Actions"
  - if possible never delete stuff from the whiteboard (only cross out)
- after successful resolution of the incident
  - use the falsifaction results for the post mortem
  - do not skip the final meeting, show everyone
    - how the incident was resolved
    - what were the correct presumptions
    - what were the incorrect presumptions and why
    - but defer all learnings to the postmortem as it needs good preparation

## OPA Example

This is an example how a OPA meeting series could go. The different dashboard contents for each
meeting are shown. Changed points are marked bold.

### Meeting 1

*For the first meeting note how it is visible that there were failed solution attempts before and how
often presumptions do hide in the initial observations like in "identical cluster".*

_Observations_
- Customers cannot access the website
- Monitoring shows 90% CPU utilization
- Rollback did not solve the problem
- Simple restart did not help
- Platform team says no chances today
- Other system in identical cluster B doesn't have the issue

_Presumptions_
1. Cluster A is identical to cluster B
2. Scale out could help

_Actions_
- Check for differences in cluster A to cluster B setup (P1)
- Perform scale out, double resources (P2)

## Meeting 2

_Observations_
- Customers cannot access the website
- Monitoring shows 90% CPU utilization
- Rollback did not solve the problem
- Simple restart did not help
- Platform team says no chances today
- Other system in identical cluster B doesn't have the issue
- **Scale out did not help**
- **Cluster A has a different SAN storage**

_Presumptions_
1. **~~Cluster A is identical to cluster B~~** (false)
2. **~~Scale out could help~~** (false)
3. **Cluster A SAN storage is faulty**
4. **High CPU utilization is caused by retries against the storage**

_Actions_
- **~~Check for differences in cluster A to cluster B setup (P1)~~**
- **~~Perform scale out, double resources (P2)~~**
- **Check with storage team if there is a SAN problem (P3)**
- **Check log metrics for storage access duration (P4)**

## Meeting 3

*Note the productive blaming on the SAN storage that is possible because it is formulated as presumption that 
is intended to be falsified. This way it is no blaming on team members.

Also observations are truncated here for brevity.*

_Observations_
- \[...]
- Other system in identical cluster B doesn't have the issue
- Scale out did not help
- Cluster A has a different SAN storage
- **Cluster A SAN storage works properly**
- **High CPU is caused by storage access**

_Presumptions_
1. ~~Cluster A is identical to cluster B~~ (false)
2. ~~Scale out could help~~ (false)
3. **~~Cluster A SAN storage is faulty~~** (false)
4. **~~High CPU utilization is caused by retries against the storage~~** (true)
5. **Cluster A SAN storage behaviour has changed**

_Actions_
- ~~Check for differences in cluster A to cluster B setup (P1)~~
- ~~Perform scale out, double resources (P2)~~
- **~~Check with storage team if there is a SAN problem (P3)~~**
- **~~Check log metrics for storage access duration (P4)~~**
- **Check for changes to SAN config/firmware (P5)**

## Meeting 4

_Observations_
- \[...]
- Cluster A has a different SAN storage
- Cluster A SAN storage works properly
- High CPU is caused by storage access
- **Cluster A SAN storage had a firmware update yesterday**

_Presumptions_
1. ~~Cluster A is identical to cluster B~~ (false)
2. ~~Scale out could help~~ (false)
3. ~~Cluster A SAN storage is faulty~~ (false)
4. ~~High CPU utilization is caused by retries against the storage~~ (true)
5. **~~Cluster A SAN storage behaviour has changed~~** (true)

_Actions_
- ~~Check for differences in cluster A to cluster B setup (P1)~~
- ~~Perform scale out, double resources (P2)~~
- ~~Check with storage team if there is a SAN problem (P3)~~
- ~~Check log metrics for storage access duration (P4)~~
- **~~Check for changes to SAN config/firmware (P5)~~**
- **Check Changelog of SAN firmware upgrade + contact support (P5)** 

## Meeting 5

_Observations_
- \[...]
- Cluster A SAN storage works properly
- High CPU is caused by storage access
- Cluster A SAN storage had a firmware update yesterday
- **Cluster A SAN storage new firmware has introduced some suspect changes**

_Presumptions_
1. ~~Cluster A is identical to cluster B~~ (false)
2. ~~Scale out could help~~ (false)
3. ~~Cluster A SAN storage is faulty~~ (false)
4. ~~High CPU utilization is caused by retries against the storage~~ (true)
5. ~~Cluster A SAN storage behaviour has changed~~ (true)
6. **The way our code uses the SAN is not compatible anymore**

_Actions_
- ~~Check for differences in cluster A to cluster B setup (P1)~~
- ~~Perform scale out, double resources (P2)~~
- ~~Check with storage team if there is a SAN problem (P3)~~
- ~~Check log metrics for storage access duration (P4)~~
- ~~Check for changes to SAN config/firmware (P5)~~
- **~~Check Changelog of SAN firmware upgrade + contact support (P5)~~**
- **Try adapting the storage client config to the settings required by the firmware version (P6)**
- **Clarify wether the storage team can revert the update**

## Meeting 5

_Observations_
- \[...]
- High CPU is caused by storage access
- Cluster A SAN storage had a firmware update yesterday
- Cluster A SAN storage new firmware has introduced some supspect changes
- **Storage teams says rollback is not supported**
- **CPU usage down to normal levels after storage client config change** -> SOLUTION

_Presumptions_
1. ~~Cluster A is identical to cluster B~~ (false)
2. ~~Scale out could help~~ (false)
3. ~~Cluster A SAN storage is faulty~~ (false)
4. ~~High CPU utilization is caused by retries against the storage~~ (true)
5. ~~Cluster A SAN storage behaviour has changed~~ (true)
6. **~~The way our code uses the SAN is not compatible anymore~~** (true)

_Actions_
- ~~Check for differences in cluster A to cluster B setup (P1)~~
- ~~Perform scale out, double resources (P2)~~
- ~~Check with storage team if there is a SAN problem (P3)~~
- ~~Check log metrics for storage access duration (P4)~~
- ~~Check for changes to SAN config/firmware (P5)~~
- **~~Check Changelog of SAN firmware upgrade + contact support (P5)~~**
- **~~Try adapting the storage client config to the settings required by the firmware version (P6)~~**
- **~~Clarify wether the storage team can revert the update~~**

*With the solution found the meeting series ends.*
