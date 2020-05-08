import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Transaction } from '../core/models/transaction';
import { TransactionsService } from './transactions.service';

@Component({
  selector: 'bd-transactions',
  templateUrl: './transactions.component.html'
})
export class TransactionsComponent implements OnInit {
  transactions$: Observable<any>;
  loading$: Observable<boolean>;

  constructor(private transactionsService: TransactionsService) {
    this.transactions$ = transactionsService.entities$;
    this.loading$ = this.transactionsService.loading$;
  }

  ngOnInit(): void {
    this.getTransactions();
  }

  getTransactions(): void {
    this.transactionsService.getAll();
  }
}
