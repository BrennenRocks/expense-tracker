import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BalanceComponent } from './balance/balance.component';
import { TransactionsComponent } from './transactions.component';



@NgModule({
  declarations: [BalanceComponent, TransactionsComponent],
  imports: [
    CommonModule
  ],
  exports: [
    TransactionsComponent
  ]
})
export class TransactionsModule { }
