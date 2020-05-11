import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BalanceComponent } from './balance/balance.component';
import { TransactionsComponent } from './transactions.component';
import { IncomeExpensesComponent } from './income-expenses/income-expenses.component';
import { TransactionListComponent } from './transaction-list/transaction-list.component';
import { TransactionComponent } from './transaction-list/transaction/transaction.component';
import { FormsModule } from '@angular/forms';
import { CoreModule } from '../core/core.module';
import { AddTransactionComponent } from './add-transaction/add-transaction.component';



@NgModule({
  declarations: [BalanceComponent, TransactionsComponent, IncomeExpensesComponent, TransactionListComponent, TransactionComponent, AddTransactionComponent],
  imports: [
    CommonModule, CoreModule, FormsModule
  ],
  exports: [
    TransactionsComponent
  ]
})
export class TransactionsModule { }
