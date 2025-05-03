This is a decision collection on when to start which listed pattern when you 
are working without a framework library (like React) and are free to choose the
complexity thresholds.

The goal of course is to not misapply pattern below the right complexity threshold
to avoid overengineering and to apply them at the threshold to avoid code complexity
caused by not abstracting.

**This is heavily biased! Please give feedback by pull requests!**

## When to introduce ...

### Views

- as soon as you want to dynamically update a part of your app GUI

### Models

- Your code has 2-3 data sources
- Access to a single data source is spread over classes that have nothing to do with each other

### Datasource Schema

- as soon as possible

### Controllers

- If you have more than one input data source (mouse, keyboard, touch) and multiple views where
  you need to configure them
- When you have >2-3 independent use cases operating modes of your application

### Router

- when you need to extract+validate parameters from route endpoints

### Commands (aka actions / event-driven)

- When you have more than 2 listeners you some change
- When you plan a complex composable GUI

### Config Management

- when you need to merge multiple sources of configuration
- when you different config source have different lifecycles

### Plugins

- When you want you end-users to extend you application

### Clients

- When there are multiple execution interfaces for your frontend

### API

- when you have multiple clients with different needs
- when you have a distributed architecture

### API Gateway

- once you want to impose non-functional requirements on your API
