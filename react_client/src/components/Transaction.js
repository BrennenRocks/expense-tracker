import React, { useContext } from 'react'
import { GlobalContext } from '../context/GlobalState';
import { numberWithCommas } from '../util/format';

export const Transaction = ({ transaction }) => {
  const { deleteTransaction } = useContext(GlobalContext);

  const sign = transaction.amount < 0 ? '-' : '+';
  const color = transaction.amount < 0 ? 'minus' : 'plus';

  return (
    <li className={color}>
      {transaction.text} <span>{sign}${ numberWithCommas(Math.abs(transaction.amount))}</span>
      <button onClick={() => deleteTransaction(transaction._id)} className="delete-btn">x</button>
    </li>
  )
}
