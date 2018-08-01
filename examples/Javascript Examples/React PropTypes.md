See also <?add topic='React'?>

## Importing PropTypes module

Since v15.5, React.PropTypes has moved into a different package named ["prop-types"](https://www.npmjs.com/package/prop-types). Import it with

     import PropTypes from 'prop-types';
     
And change your "React.PropTypes.xxx" to "PropTypes.xxx"
     
## All Basic PropTypes

Here is a table of available PropTypes

| Name                | Type  |
| ------------------- | ----- |
| PropTypes.any       | Anything |
| PropTypes.array     | Array (no type enforced, see PropTypes.arrayOf() for type enforcing) |
| PropTypes.bool      | Boolean |
| PropTypes.func      | Function |
| PropTypes.number    | Integer |
| PropTypes.object    | Javascript Object |
| PropTypes.string    | String |
| PropTypes.symbol    | Symbols |
| PropTypes.node      | A renderable type (number, string, element, array...)
| PropTypes.element   | React Element |

## Advanced PropTypes

For complex objects or real validation use those constructs

| Construct                  | Description  |
|----------------------------|--------------|
| PropTypes.instanceOf(obj)  | Ensure instance of specific class |
| PropTypes.oneOf(array)     | Enum, ensure property matches one of the values in the array |
| PropTypes.oneOfType(array) | Enum, ensure property matches one of the types in the array |
| PropTypes.arrayOf(type)    | Ensure property matches an array of elements of a given type |
| PropTypes.objectOf(type)   | Ensure property matches an object (hash) of elements of a given type |
| PropTypes.shape({ })       | Ensure object of certain shape with proptypes given as parameter |
| xxx.isRequired | Require the property xxx |

If this is not enough use functions passed to PropTypes.arrayOf() and PropTypes.objectOf() to declare real exotic types

    myStrangeProp: PropTypes.arrayOf(function(propValue, key, componentName, location, propFullName) {
      if (doSomeSpecialValidation(propValue[key])) {
         return new Error('Invalid prop `' + propFullName + '` supplied to' + ' `' + componentName + '`. Validation failed.'
      );
    }

## Declaring Property Types

Simply add a propTypes member to your React.Component and declare the types for all expected properties

    class MyApp extends React.Component {
       render() {
           return {
               <h1>Some value: {this.props.value}</h1>
           }
       }
    }
    
    // Add proptype for "value"
    MyApp.propTypes = {
       value: PropTypes.number
    };

## Adding Defaults

To add some defaults declare a "defaultProps" member like this

    MyApp.defaultProps = {
        name: 'Julia',
        age: 18
    };
