import { Component, OnInit, Input } from '@angular/core';
import { Transaction } from 'src/app/core/models/transaction';
import { TransactionsService } from '../../transactions.service';

@Component({
  selector: 'bd-transaction',
  templateUrl: './transaction.component.html',
})
export class TransactionComponent implements OnInit {

  private _transaction: Transaction;
  @Input() get transaction(): Transaction {
    return this._transaction;
  }

  set transaction(value: Transaction) {
    if (value) {
      this._transaction = value;
      this.sign = this._transaction.amount < 0 ? '-' : '+';
      this.color = this._transaction.amount < 0 ? 'minus' : 'plus';
    }
  }

  sign: string; 
  color: string;

  constructor(private transactionService: TransactionsService) { }

  ngOnInit(): void {
  }

  deleteTransaction(id: string): void {
    this.transactionService.deleteTransaction(id);
  }

}
