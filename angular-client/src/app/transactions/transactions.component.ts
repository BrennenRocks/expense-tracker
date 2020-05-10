import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Transaction } from '../core/models/transaction';
import { TransactionsService } from './transactions.service';

@Component({
  selector: 'bd-transactions',
  templateUrl: './transactions.component.html'
})
export class TransactionsComponent implements OnInit {
  transactions$: Observable<Transaction[]>;

  constructor(private transactionsService: TransactionsService) {
  }

  ngOnInit(): void {
    this.getTransactions();
  }

  getTransactions(): void {
    this.transactions$ = this.transactionsService.getAll();
  }
}
