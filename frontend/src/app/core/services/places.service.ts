import { Injectable } from '@angular/core';
import {environment} from '../../../environments/environment';
import {HttpClient, HttpParams} from '@angular/common/http';
import { Observable } from 'rxjs';
import { PlaceModel } from '../../shared/models/place.model';



@Injectable({
  providedIn: 'root'
})
export class PlacesService {

  controllerUrl: string = environment.apiURL + '/places';

  constructor(private http: HttpClient) {
  }

  GetPlaces(graveyardId: string): Observable<PlaceModel[]> {
    return this.http.get<PlaceModel[]>(this.controllerUrl + '?search=' + graveyardId);
  }
}
