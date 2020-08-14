import { Component, OnInit, Inject, OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';
import { CreateOrderModel, OrderInfoModel, ManageOrderModel } from 'src/app/shared/models/order.model';
import { AuthorizationService } from 'src/app/core/services/authorization.service';
import { OrdersService } from 'src/app/core/services/orders.service';
import { L10N_LOCALE, L10nLocale } from 'angular-l10n';
import { Router, ActivatedRoute } from '@angular/router';
import {MatSnackBar} from '@angular/material/snack-bar';
import { FormBuilder, FormGroup, FormControl, Validators, FormArray } from '@angular/forms';

@Component({
  selector: 'app-orders',
  templateUrl: './orders.component.html',
  styleUrls: ['./orders.component.css']
})
export class OrdersComponent implements OnInit {
  subscription: Subscription;
  orders: OrderInfoModel[];

  constructor(
    private authService: AuthorizationService,
    private ordersServise: OrdersService,
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private _snackBar: MatSnackBar,
    @Inject(L10N_LOCALE) public locale: L10nLocale
  ) {
    authService.isLoggedIn.subscribe(logged => {
      if (!logged){
        this.router.navigate(['']);
      }
    });
   }

  ngOnInit(): void {
    this.getOrders();
  }

  getOrders(): void {
    this.ordersServise.GetOrders().subscribe(
      res => {
        this.orders = res;
      });
  }

  sendOrder(orderPay: ManageOrderModel): void {
    this.ordersServise.UpdateOrderStatus(orderPay).subscribe(
      res => {
        this.getOrders();
      },
      error => {
        this._snackBar.open(error, 'Close', {
          duration: 5000,
        });
      });
  }

  onPay(orderId, toPay){
    const orderPay = {
      id: orderId,
      to_pay: toPay,
      status: 'paid'
    } as ManageOrderModel;
    this.sendOrder(orderPay);
  }

  onCancell(orderId){
    const orderPay = {
      id: orderId,
      to_pay: 0,
      status: 'cancelled'
    } as ManageOrderModel;
    this.sendOrder(orderPay);
  }

}
