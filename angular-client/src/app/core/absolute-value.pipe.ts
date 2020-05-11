import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'abs'
})
export class AbsoluteValuePipe implements PipeTransform {

  transform(num: number): unknown {
    return Math.abs(num);
  }

}
