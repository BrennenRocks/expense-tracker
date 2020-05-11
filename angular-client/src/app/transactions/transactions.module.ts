import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BalanceComponent } from './balance/balance.component';
import { TransactionsComponent } from './transactions.component';
import { IncomeExpensesComponent } from './income-expenses/income-expenses.component';
import { TransactionListComponent } from './transaction-list/transaction-list.component';
import { TransactionComponent } from './transaction-list/transaction/transaction.component';
import { AbsoluteValuePipe } from '../core/absolute-value.pipe';
import { CoreModule } from '../core/core.module';



@NgModule({
  declarations: [BalanceComponent, TransactionsComponent, IncomeExpensesComponent, TransactionListComponent, TransactionComponent],
  imports: [
    CommonModule, CoreModule
  ],
  exports: [
    TransactionsComponent
  ]
})
export class TransactionsModule { }
