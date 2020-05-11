import { Component, OnInit } from '@angular/core';
import { TransactionsService } from '../transactions.service';

@Component({
  selector: 'bd-add-transaction',
  templateUrl: './add-transaction.component.html',
})
export class AddTransactionComponent implements OnInit {

  text: string;
  amount: number;

  constructor(private transactionService: TransactionsService) { }

  ngOnInit(): void {
  }

  addTransaction(): void {
    this.transactionService.addTransaction(this.text, this.amount);
    this.text = "";
    this.amount = null;
  }

}
