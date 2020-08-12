import { Injectable } from '@angular/core';
import {environment} from '../../../environments/environment';
import {HttpClient, HttpParams} from '@angular/common/http';
import { Observable } from 'rxjs';
import { GraveyardModel } from '../../shared/models/graveyard.model';



@Injectable({
  providedIn: 'root'
})
export class GraveyardsService {

  controllerUrl: string = environment.apiURL + '/graveyards';

  constructor(private http: HttpClient) {
  }

  GetGraveyards(): Observable<GraveyardModel[]> {
    return this.http.get<GraveyardModel[]>(this.controllerUrl);
  }

  GetConcreteGraveyard(id: string): Observable<GraveyardModel> {
    return this.http.get<GraveyardModel>(this.controllerUrl + '/' + id + '/');
  }
}
