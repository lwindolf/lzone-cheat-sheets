See also <?add topic='React'?>

## Minimal application

    import React from 'react'
    import ReactDOM from 'react-dom'
    
    ReactDOM.render(<div>Test</div>, document.getElementById('content'));
    
## Writing React.js Components

### Writing a stateless React component

Just return some static HTML

    const MyComponent = () => {
      return <div>some HTML</div>
    }
    
If you want to have parameters

    const MyComponent = (param) => {
      return <div>some {param.name}</div>
    }

Using a stateless component

    React.DOM.render(<MyComponent />, document.getElementById('content'))
    
## Real component with full lifecycle

    class MyApp extends React.Component {
        constructor(props) {
            super(propes);
            // init...
        }
        
        render() {
            return (
               <div> Stuff </div>
            )
        }
        
        // now all lifecycle callbacks
        componentWillMount() {}
        componentDidMount() {}
        componentWillUnmount() {}
        
        componentWillReceiveProps() {}
        componentDidReceiveProps() {}
        
        shouldComponentUpdate() {}
        
        componentWillUpdate() {}
        componentDidUpdate() {}
}
