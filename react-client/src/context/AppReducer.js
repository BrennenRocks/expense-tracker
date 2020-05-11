import ActionConst from "./ActionConst"

export default (state, action) => {
  switch(action.type) {
    case ActionConst.TRANSACTIONS_GET:
      return {
        ...state,
        loading: false,
        transactions: action.payload
      }
    case ActionConst.TRANSACTION_ADD:
      return {
        ...state,
        loading: false,
        transactions: [...state.transactions, action.payload]
      }
    case ActionConst.TRANSACTION_DELETE: 
      return {
        ...state,
        loading: false,
        transactions: state.transactions.filter(transaction => transaction._id !== action.payload)
      }
    case ActionConst.TRANSACTION_ERROR:
      return {
        ...state,
        error: action.payload
      }
    default:
      return state;
  }
}