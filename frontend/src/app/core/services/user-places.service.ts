import { Injectable } from '@angular/core';
import {environment} from '../../../environments/environment';
import {HttpClient, HttpParams} from '@angular/common/http';
import { Observable } from 'rxjs';
import { PlaceModel, PlaceInfoModel } from '../../shared/models/place.model';



@Injectable({
  providedIn: 'root'
})
export class UserPlacesService {

  controllerUrl: string = environment.apiURL + '/my_places';

  constructor(private http: HttpClient) {
  }

  GetMyPlaces(): Observable<PlaceInfoModel[]> {
    return this.http.get<PlaceInfoModel[]>(this.controllerUrl);
  }
}
