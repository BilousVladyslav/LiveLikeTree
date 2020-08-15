import { Component, OnInit, Inject, OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';
import { GraveyardModel } from 'src/app/shared/models/graveyard.model';
import { PlaceModel } from 'src/app/shared/models/place.model';
import { CreateOrderModel, OrderInfoModel } from 'src/app/shared/models/order.model';
import { GraveyardsService } from 'src/app/core/services/graveyards.service';
import { AuthorizationService } from 'src/app/core/services/authorization.service';
import { OrdersService } from 'src/app/core/services/orders.service';
import { PlacesService } from 'src/app/core/services/places.service';
import { L10N_LOCALE, L10nLocale } from 'angular-l10n';
import { Router, ActivatedRoute } from '@angular/router';
import {MatSnackBar} from '@angular/material/snack-bar';
import { FormBuilder, FormGroup, FormControl, Validators, FormArray } from '@angular/forms';

@Component({
  selector: 'app-graveyard',
  templateUrl: './graveyard.component.html',
  styleUrls: ['./graveyard.component.css']
})
export class GraveyardComponent implements OnInit, OnDestroy {
  subscription: Subscription;
  graveyardId: string;
  graveyard: GraveyardModel;
  places: PlaceModel[];
  selectedPlaces: string[] = [];
  isLogged = false;
  orderFormGroup: FormGroup;
  placesFormArray: FormArray;

  constructor(
    private graveyardService: GraveyardsService,
    private placesService: PlacesService,
    private authService: AuthorizationService,
    private ordersServise: OrdersService,
    private router: Router,
    private route: ActivatedRoute,
    private fb: FormBuilder,
    private _snackBar: MatSnackBar,
    @Inject(L10N_LOCALE) public locale: L10nLocale
  ) {
    this.graveyardId = this.route.snapshot.params['id'];
  }

  ngOnInit(): void {
    this.authService.isLoggedIn.subscribe(x => {
      this.isLogged = x;
    });

    this.graveyardService.GetConcreteGraveyard(this.graveyardId)
      .subscribe(data => {
        this.graveyard = data;
        if (this.isLogged) {
          this.createOrderFormGroup();
        }
      });
    this.getPlaces();
  }

  getPlaces(): void{
    this.placesService.GetPlaces(this.graveyardId)
      .subscribe(data => {
        this.places = data;
      });
  }

  createOrderFormGroup(): void {
    this.orderFormGroup = this.fb.group({
      graveyard: new FormControl(this.graveyardId),
      places: new FormArray([], [Validators.required]),
    });
    this.placesFormArray = this.orderFormGroup.get('places') as FormArray;
  }

  createPlaceFormGroup(place: PlaceModel): FormGroup {
    return this.fb.group({
      id: new FormControl(place.id),
      number: new FormControl(place.number),
      tree: new FormControl('', [Validators.required, Validators.minLength(5)]),
    });
  }

  addPlace(place: PlaceModel): void {
    this.placesFormArray.push(this.createPlaceFormGroup(place));
  }

  removePlace(index: number): void {
    this.placesFormArray.removeAt(index);
  }

  getColor(isBusy: boolean, id: string): string{
    if (isBusy){
      return 'dimgrey';
    }
    if (this.selectedPlaces.includes(id)){
      return 'green';
    }
    return 'lightgreen';
  }

  selectPlace(place: PlaceModel): void{
    if (this.selectedPlaces.includes(place.id)){
      this.selectedPlaces.forEach( (item, index) => {
        if (item === place.id) {
          this.selectedPlaces.splice(index, 1);
          this.removePlace(index);
        }
      });
    }
    else {
      this.selectedPlaces.push(place.id);
      this.addPlace(place);
    }
  }

  onSubmit(): void{
    const orderViewModel = this.orderFormGroup.value as CreateOrderModel;
    this.ordersServise.CreateOrder(orderViewModel).subscribe(
      res => {
        this._snackBar.open('Successdully created order.', 'Close', {
          duration: 3000,
        });
        this.getPlaces();
        this.placesFormArray.clear();
        this.orderFormGroup.reset();
        this.selectedPlaces = [];
      },
      error => {
        this._snackBar.open(error, 'Close', {
          duration: 3000,
        });
      });
  }

  formIsValid(): boolean{
    return this.orderFormGroup.valid;
  }

  ngOnDestroy(): void {
    if (this.subscription){
      this.subscription.unsubscribe();
    }
  }
}
