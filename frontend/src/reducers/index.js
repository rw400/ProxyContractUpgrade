import {combineReducers} from 'redux'
import CounterReducer from './CounterReducer'

export default combineReducers({
    counter: CounterReducer,
})


//Altnerative Combine reducer code
// import { combineReducers } from 'redux'

// const todoApp = combineReducers({
//   visibilityFilter,
//   todos
// })

// export default todoApp