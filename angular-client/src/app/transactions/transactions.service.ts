import { Injectable } from '@angular/core';
import { HttpUrlGenerator, DefaultDataService } from '@ngrx/data';
import { Transaction } from '../core/models/transaction';
import { Observable } from 'rxjs';

import { map, tap } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class TransactionsService extends DefaultDataService<Transaction> {

  constructor(http: HttpClient, httpUrlGenerator: HttpUrlGenerator) {
    super('Transaction', http, httpUrlGenerator);
   }

   getAll(): Observable<Transaction[]> {
     return super.getAll()
      .pipe(
        // tap(res => console.log(res)), // store other values from the request into the store
        map((res: any) => res.data)
      );
   }
}
