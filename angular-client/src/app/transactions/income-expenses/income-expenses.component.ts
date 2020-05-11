import { Component, OnInit } from '@angular/core';
import { Transaction } from 'src/app/core/models/transaction';
import { Observable } from 'rxjs';
import { TransactionsService } from '../transactions.service';

@Component({
  selector: 'bd-income-expenses',
  templateUrl: './income-expenses.component.html',
})
export class IncomeExpensesComponent implements OnInit {

  transactions$: Observable<Transaction[]>;

  income: string;
  expense: string;

  constructor(private transactionService: TransactionsService) {
    this.transactions$ = transactionService.entities$;
  }

  ngOnInit(): void {
    this.transactions$.subscribe((transactions: Transaction[]) => {
      const amounts = transactions.map(transaction => transaction.amount);

      this.income = amounts
        .filter(item => item > 0)
        .reduce((acc, item) => (acc += item), 0)
        .toFixed(2);
    
      this.expense = (
        amounts
        .filter(item => item < 0)
        .reduce((acc, item) => (acc += item), 0) * -1
      ).toFixed(2);
    });
  }

}
