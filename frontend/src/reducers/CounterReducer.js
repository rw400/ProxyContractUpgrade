const initialState = {
    hash: 0,
    idNum: 0,
    count: 0, 
}

function CounterReducer (state = initialState, action){
    switch(action.type){
        case "TRANSACTION_HASH": {
            return {...state, ...action}
        }
        case "MIGRATION_ID": {
            return {...state, ...action}
        }
        case "INCREMENT_COUNT": {
            return {...state, ...action}
        }
        case "DECREMENT_COUNT": {
            return {...state, ...action}
        }
        default:
            return state
    }
} 

export default CounterReducer;