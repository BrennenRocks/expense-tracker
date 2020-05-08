import ReducerConst from "./ReducerConst"

export default (state, action) => {
  switch(action.type) {
    case ReducerConst.TRANSACTIONS_GET:
      return {
        ...state,
        loading: false,
        transactions: action.payload
      }
    case ReducerConst.TRANSACTION_ADD:
      return {
        ...state,
        loading: false,
        transactions: [...state.transactions, action.payload]
      }
    case ReducerConst.TRANSACTION_DELETE: 
      return {
        ...state,
        loading: false,
        transactions: state.transactions.filter(transaction => transaction._id !== action.payload)
      }
    case ReducerConst.TRANSACTION_ERROR:
      return {
        ...state,
        error: action.payload
      }
    default:
      return state;
  }
}