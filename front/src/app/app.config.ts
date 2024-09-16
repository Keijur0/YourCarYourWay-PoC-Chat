import { provideCommon } from '@angular/common';
import { ApplicationConfig } from '@angular/core';
import { provideForms } from '@angular/forms';
import { provideRouter } from '@angular/router';
import { routes } from './app.routes';

export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes),
    provideCommon(),
    provideForms()
  ]
};
