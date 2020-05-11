import { Component, OnInit, Input } from '@angular/core';
import { Transaction } from 'src/app/core/models/transaction';
import { TransactionsService } from '../transactions.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'bd-balance',
  templateUrl: './balance.component.html',
})
export class BalanceComponent implements OnInit {

  // If you want to have the transactions passed from the parent
  // private _transactions: Transaction[] = [];
  // @Input() get transactions(): Transaction[] {
  //   return this._transactions;
  // }    
  
  // set transactions(value: Transaction[]) {
  //   if (value) {
  //     this._transactions = value;
  //     this.balance = this.calculateBalance();
  //   }
  // }

  transactions$: Observable<Transaction[]>;

  balance: string;

  constructor(private transactionsService: TransactionsService) {
    this.transactions$ = transactionsService.entities$;
  }

  ngOnInit(): void {
    this.transactions$.subscribe((transations: Transaction[]) => {
      this.balance = this.calculateBalance(transations);
    });
   }

  calculateBalance(transactions: Transaction[]): string {
    const amounts = transactions.map(transaction => transaction.amount);
    return amounts.reduce((acc, item) => (acc += item), 0).toFixed(2);
  }

}
