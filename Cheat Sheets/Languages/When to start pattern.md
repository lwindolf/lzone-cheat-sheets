This is a decision collection on when to start which listed pattern when you 
are working without a framework library (like React) and are free to choose the
complexity thresholds.

The goal of course is to not misapply any pattern below the specific complexity threshold
to avoid overengineering and to apply them at the threshold to avoid code complexity
caused by not abstracting.

**This is heavily biased! Please give feedback by pull requests!**

## When to introduce ...

### Application

This is about having an instance managing application setup and teardown

- once you have 2-3 stateful classes that need sequential initialization on startup

### Views

- as soon as you want to dynamically update a part of your app GUI

### Models

- Your code has 2-3 data sources
- Access to a single data source is spread over classes that have nothing to do with each other

### Controllers

- If you have more than one input data source (mouse, keyboard, touch) and multiple views where
  you need to configure them
- When you have >2-3 independent use cases operating modes of your application

### Data sources

- When the same model can "plug-in" multiple data source (e.g. based on the runtime env)

### Data source schemata

This means having an explicit and versioned data source schema and migration handling.

- as soon as possible

### Transaction Manager

- as soon as you have non-functional requirements on data sources
- if you need to coordinate consistency between multiple data sources

### Router

- when you need to extract+validate parameters from route endpoints
- when you want to annotate multiple routes with non-functional requirements

### Commands (aka actions / event-driven)

- When you have more than 2 listeners you some change
- When you plan a complex composable GUI

### Config Management

- when you need to merge multiple sources of configuration
- when your different config source have different lifecycles
- when you have config inheritance (and need to merge configs)

### Variant Management

This is about introducing build time configuration and software+config stack management

- once you have >2-3 customers with alternatives in the software stack or configuration complexity

### Batch System

- when you need to continue data processing over restarts
- when you have parallel data processing
- when the execution state is non-trivial (follows a state machine)
- when you have concurreny limits

### Workflow Manager

- once you want end users to customize your business logic

### Plugins

- When you want you end-users to extend your application

### Package Manager

- Once people start building "distributions" of your software parts

### Clients

- When there are multiple execution interfaces for your frontend

### API

- when you have multiple clients with different needs
- when you have a distributed architecture

### API Gateway

- once you want to impose non-functional requirements on your API

### Metrics

This is about explicitely tracking and exposing monitoring metrics

- once you need to proof objectives from non-functional requirements for your business logic
