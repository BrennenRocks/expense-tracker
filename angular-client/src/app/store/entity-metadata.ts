import { EntityMetadataMap, EntityDataModuleConfig } from '@ngrx/data';

const selectId = entity => entity._id;

const entityMetadata: EntityMetadataMap = {
  Transaction: {
    selectId
  }
};

const pluralNames = {  };

export const entityConfig: EntityDataModuleConfig = {
  entityMetadata,
  pluralNames
};
