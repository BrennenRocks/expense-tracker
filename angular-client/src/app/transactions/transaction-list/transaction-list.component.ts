import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { Transaction } from 'src/app/core/models/transaction';
import { TransactionsService } from '../transactions.service';

@Component({
  selector: 'bd-transaction-list',
  templateUrl: './transaction-list.component.html',
})
export class TransactionListComponent implements OnInit {

  transactions$: Observable<Transaction[]>

  constructor(private transactionService: TransactionsService) {
    this.transactions$ = transactionService.entities$;
  }

  ngOnInit(): void {}

}
