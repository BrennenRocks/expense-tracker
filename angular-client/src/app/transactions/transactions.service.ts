import { Injectable } from '@angular/core';
import { EntityCollectionServiceBase, EntityCollectionServiceElementsFactory } from '@ngrx/data';
import { Transaction } from '../core/models/transaction';

@Injectable({
  providedIn: 'root'
})
export class TransactionsService extends EntityCollectionServiceBase<Transaction> {

  constructor(serviceElementsFactory: EntityCollectionServiceElementsFactory) {
    super('Transaction', serviceElementsFactory);
   }
}
