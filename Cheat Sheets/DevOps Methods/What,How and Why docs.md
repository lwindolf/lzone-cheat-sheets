Splitting your documentation into "What?", "How?" and "Why?" helps keeping documentation up-to-date.

## When to use?

- When you have a large corpus of documentation that needs maintaining
- When you are unsure if all your systems are actually documented
- When you want to improve documentation quality for onboarding

## Difference of What / How / Why

| Type     | Freshness            | Description                                            |
|----------|----------------------|--------------------------------------------------------|
| What     | old, often outdated  | Concepts, Introductions, Context...                    |
| Why      | old, but still valid | for example ADRs                                       |
| How      | always up-to-date    | per component/server/application actionable documents  |

## Don't try updating the "What?"

You gain the maximum benefit from the documentation split by stopping to try to update the "What?"
documentation type. Only keep the "How?" up-to-date at all times.

## Update the "How?" all the time

The best way to do this is to work documentation driven. When you work on a system/component/...
open up it's documentation first and copy&paste commands from the documentation. Even do this when
you are a senior because it ensures the documentation is correct and any colleguage can do it.

## Impact on onboarding

Once your documentation is structured like this one of the first tasks in the onboading can be a first
summary reading of the "What?" documentation and a intensive reading of the "Why?" documentation.

New onboardees immediately learn about what you and and which decisions you made. They might get 
confidence, because the identify similar decision they had in previous projects and they got a first
introduction into your stack with the "What?" documentation.

At the same time they are not bothered by system specifics contained in the "How?" documentation.
