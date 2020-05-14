import React, { createContext, useReducer } from 'react';
import AppReducer from './AppReducer';
import axios from 'axios';
import ActionConst from './ActionConst';

const initialState = {
  transactions: [],
  error: null,
  loading: true
};

export const GlobalContext = createContext(initialState);

export const GlobalProvider = ({ children }) => {
  const [state, dispatch] = useReducer(AppReducer, initialState);

  const getTransactions = async () => {
    try {
      const res = await axios.get('/api/v1/transactions');

      dispatch({
        type: ActionConst.TRANSACTIONS_GET,
        payload: res.data.data
      });
    } catch (err) {
      dispatch({
        type: ActionConst.TRANSACTION_ERROR,
        payload: err.response.data.error
      });
    }
  };

  const deleteTransaction = async id => {
    try {
      await axios.delete(`/api/v1/transactions/${id}`);

      dispatch({
        type: ActionConst.TRANSACTION_DELETE,
        payload: id
      });
    } catch (err) {
      dispatch({
        type: ActionConst.TRANSACTION_ERROR,
        payload: err.response.data.error
      });
    }
  }

  const addTransaction = async transaction => {
    const config = {
      headers: {
        'Content-Type': 'application/json'
      }
    }

    try {
      const res = await axios.post('/api/v1/transactions', transaction, config);

      dispatch({
        type: ActionConst.TRANSACTION_ADD,
        payload: res.data.data[0]
      });
    } catch (err) {
      dispatch({
        type: ActionConst.TRANSACTION_ERROR,
        payload: err.response.data.error
      });
    }
  }

  return (<GlobalContext.Provider value={{
    transactions: state.transactions,
    error: state.error,
    loading: state.loading,
    getTransactions,
    deleteTransaction,
    addTransaction
  }}>
    {children}
  </GlobalContext.Provider>);
};