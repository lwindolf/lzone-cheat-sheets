This is about an IT ops incident reponse method called "OPA" short for

1. Oberservation
2. Presumptions
3. Actions

Please note, that I do not know whom to credit for this. If you know please let me know or create a PR!

## When to use it?

In generel this is a complementary method that you use when your normal incident playbook does not work.
I suggest to always start with the normal incident response playbook and only later on to switch to this.
Here are some criteria for the switch:

- In the short interval incident sync meeting everyone is spechless about what to do
- There is a lot of infighting about what to do
- You executed you incident handling reponse playbook without any good results

## How to "do" OPA?

You simple use your periodic incident standups differently. If you do not have such, start immediately.
Have a meeting every 30min / 45min / 1h depending on your business and urgency.

Start OPA by

1. Explaining what it is and why you are switching
2. Setting up a digital / analog whiteboard
3. Add 3 sections "Observations", "Presumptions", "Actions"
4. Nominate a moderator / organizer

Hold the meeting

1. Updating the "Observations"
  - add all known details
  - cross out (do not delete) incorrect/unrelated stuff
  - ensure there are only facts in "Observations" never "Presumptions"

2. Updating the "Actions" and "Presumptions"
  - starting with the 2nd meeting 
    - cross out (do not delete) all falsified "Presumptions"
    - note the results of all performed "Actions" and cross them out
  - add new actions and presumptions
    - every action should prove/falsify a presumption
    - add the presumption number to the action

3. Plan next iteration
  - select actions to perform, assign responsible people
  - set the next meeting time

General hints
- stop people from immediately working/checking stuff during the OPA meeting
- train them to follow the OPA distinctions
- allow for contradicting "Presumptions", you falsify them anyway, showing the contradiction
  can help laying open how we have different understanding of the system
- allow and encourage for "Observations" not matching current "Presumptions" and "Actions"
- after everything is done us the falsifaction results for the post mortem
