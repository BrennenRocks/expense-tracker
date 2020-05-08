import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { environment } from 'src/environments/environment';
import { EffectsModule } from '@ngrx/effects';
import { StoreModule } from '@ngrx/store';
import { DefaultDataServiceConfig, EntityDataModule } from '@ngrx/data';
import { entityConfig } from './entity-metadata';
import { StoreDevtoolsModule } from '@ngrx/store-devtools';

const apiRoot = environment.apiUrlBase + '/';
const defaultDataServiceConfig: DefaultDataServiceConfig = {
  root: apiRoot,
  entityHttpResourceUrls: {
    Transaction: { entityResourceUrl: apiRoot + 'transactions/', collectionResourceUrl: apiRoot + 'transactions/'}
  }
}

@NgModule({
  declarations: [],
  imports: [
    EffectsModule.forRoot([]),
    EntityDataModule.forRoot(entityConfig),
    StoreModule.forRoot({}),
    environment.production ? [] : StoreDevtoolsModule.instrument()
  ],
  providers: [ { provide: DefaultDataServiceConfig, useValue: defaultDataServiceConfig } ]
})
export class AppStoreModule { }
