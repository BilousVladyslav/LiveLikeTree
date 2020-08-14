import { Injectable } from '@angular/core';
import {environment} from '../../../environments/environment';
import {HttpClient, HttpParams} from '@angular/common/http';
import { Observable } from 'rxjs';
import { OrderInfoModel, CreateOrderModel, ManageOrderModel } from '../../shared/models/order.model';



@Injectable({
  providedIn: 'root'
})
export class OrdersService {

  controllerUrl: string = environment.apiURL + '/orders/';

  constructor(private http: HttpClient) {
  }

  CreateOrder(order: CreateOrderModel): Observable<OrderInfoModel> {
    return this.http.post<OrderInfoModel>(this.controllerUrl, order);
  }

  GetOrders(): Observable<OrderInfoModel[]> {
    return this.http.get<OrderInfoModel[]>(this.controllerUrl);
  }

  UpdateOrderStatus(order: ManageOrderModel): Observable<ManageOrderModel> {
    const url = this.controllerUrl + 'manage/' + order.id + '/';
    return this.http.put<ManageOrderModel>(url, order);
  }
}
