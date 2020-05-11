import { Injectable } from '@angular/core';
import { EntityCollectionServiceBase, EntityCollectionServiceElementsFactory } from '@ngrx/data';
import { Transaction } from '../core/models/transaction';

import { map } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { ServerResponse } from '../core/models/server_response';
import { NotificationService } from '../core/notification.service';

@Injectable({
  providedIn: 'root'
})
export class TransactionsService extends EntityCollectionServiceBase<Transaction> {

  private transactionsUrl: string = environment.apiUrlBase + '/transactions';

  constructor(private http: HttpClient, entityCollectionServiceElementsFactory: EntityCollectionServiceElementsFactory, private notificationService: NotificationService) {
    super('Transaction', entityCollectionServiceElementsFactory);
   }

  getAllTransactions(): void {
    this.setLoading(true);
    this.http.get<ServerResponse>(this.transactionsUrl)
      .pipe(
        map((res: ServerResponse) => {
          this.addAllToCache(res.data);
          return res;
        })
      ).subscribe((res: ServerResponse) => {
        this.setLoading(false);
        if (!res.success) {
          this.notificationService.showError(res.error.message);
          return;
        }

        this.notificationService.showSuccess('GET Transactions');
      });
  }

  addTransaction(text: string, amount: number): void {
    this.setLoading(true);
    this.http.post<ServerResponse>(this.transactionsUrl, { text, amount })
      .pipe(
        map((res: ServerResponse) => {
          this.addOneToCache(res.data[0]);
          return res;
        })
      ).subscribe((res: ServerResponse) => {
        this.setLoading(false);
        if (!res.success) {
          this.notificationService.showError(res.error.message);
          return;
        }

        this.notificationService.showSuccess(`${res.data[0].text} successfully deleted`);
      });
  }

  deleteTransaction(id: string): void {
    this.setLoading(true);
    this.http.delete<ServerResponse>(this.transactionsUrl + `/${id}`)
      .pipe(
        map((res: ServerResponse) => {
          this.removeOneFromCache(res.data[0]);
          return res;
        })
      ).subscribe((res: ServerResponse) => {
        this.setLoading(false);
        if (!res.success) {
          this.notificationService.showError(res.error.message);
          return;
        }

        this.notificationService.showSuccess(`${res.data[0].text} successfully added`);
      });
  }
}
