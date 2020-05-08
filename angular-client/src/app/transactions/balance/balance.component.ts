import { Component, OnInit, Input } from '@angular/core';
import { Transaction } from 'src/app/core/models/transaction';

@Component({
  selector: 'bd-balance',
  templateUrl: './balance.component.html',
})
export class BalanceComponent implements OnInit {

  private _transactions: Transaction[] = [];
  @Input() get transactions(): Transaction[] {
    return this._transactions;
  }    
  
  set transactions(value: Transaction[]) {
    if (value) {
        this._transactions = value;
        this.balance = this.calculateBalance();
    }
  }

  balance: string;

  constructor() { }

  ngOnInit(): void { }

  calculateBalance(): string {
    const amounts = this.transactions.map(transaction => transaction.amount);
    return amounts.reduce((acc, item) => (acc += item), 0).toFixed(2);
  }

}
