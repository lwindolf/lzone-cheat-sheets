Blameless post mortems are special meetings that create a shared view on

- what happened
- what we learned
- what we think is worth improving
- and allows tracking what we actually are improving

## When to do it?

Hold a blameless post mortem after each incident, even when you customer didn't "see" anything.

## Post mortem templates

There are different [post mortem templates](https://github.com/dastergon/postmortem-templates) that you can use.

## Measurements

There are a variety of measurements out their. You should do a consistent measurement of your choice.
The naming doesn't matter much, as long as you measure per incident the time spans between:

- start of failure
- detection
- start of repair work
- fix

Over all your incident history you want to calculate the mean values to check for improvement.

Here is an example for measuring on a time axis:

     |<--- TTD --->|<--- TTR --->|<--- TTF --->|
     
     ^---------------------------------------------- something breaks
                   ^-------------------------------- problem gets detected (by human or monitoring)
                                 ^------------------ someone starts working on it
                                               ^---- problem is fixed

Note how some people prefer to measure relative times and some absolute times. But again, it doesn't matter
as the change in the measurements over time is the important thing. So for the above measurements you
want to calculate corresponding mean values MTTD, MTTR, MTTF over all your recent incidents.

## Important Points

- A post mortem should be blameless
- A post mortem without resulting action points should be rare
- A post mortem must be prepared up front
  - Otherwise you spend the entire meeting on the timeline
  - Have the organizer of the post mortem prepare the timelime upfront as complete as possible
    and only add missing stuff or correct mistakes in the meeting
- Depending on your team apply the Las Vegas principle and keep post mortem details internal
  - Distinguish between customer facing incident management and internal view
  - Skip this if team/org/customer are mature enough
- Use the timeline to do measurements (TTF, TTD, TTR, ..)
- From time to time measure improvement over all incidents (MTTR, ...)
- It is not necessary to always be able to identify the root case
  - It is ok, to note that "we were not able to identify the root case, but we have hypothesis A'
