import { NgModule } from '@angular/core';
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
    StoreModule.forRoot({}),
    EffectsModule.forRoot([]),
    EntityDataModule.forRoot(entityConfig),
    environment.production ? [] : StoreDevtoolsModule.instrument()
  ],
  providers: [ { provide: DefaultDataServiceConfig, useValue: defaultDataServiceConfig } ]
})
export class AppStoreModule { }
