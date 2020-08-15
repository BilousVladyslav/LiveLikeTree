import { Component, OnInit, Inject, OnDestroy } from '@angular/core';
import { AuthorizationService } from 'src/app/core/services/authorization.service';
import { UserPlacesService } from 'src/app/core/services/user-places.service';
import { Router } from '@angular/router';
import { L10N_LOCALE, L10nLocale } from 'angular-l10n';
import { Subscription } from 'rxjs';
import { PlaceInfoModel } from 'src/app/shared/models/place.model';

@Component({
  selector: 'app-places',
  templateUrl: './places.component.html',
  styleUrls: ['./places.component.css']
})
export class PlacesComponent implements OnInit, OnDestroy {
  subscription: Subscription;
  places: PlaceInfoModel[];
  displayedColumns: string[] = ['graveyardName', 'graveyardAddress', 'placeNumber', 'tree', 'treeStatus'];

  constructor(
    private authService: AuthorizationService,
    private placesService: UserPlacesService,
    private router: Router,
    @Inject(L10N_LOCALE) public locale: L10nLocale
  ) {
    authService.isLoggedIn.subscribe(logged => {
      if (!logged){
        this.router.navigate(['']);
      }
    });
   }

  ngOnInit(): void {
    this.getPlaces();
  }

  getPlaces(): void{
    this.placesService.GetMyPlaces().subscribe(
      res => {
        this.places = res;
      });
  }

  ngOnDestroy(): void {
    if (this.subscription){
      this.subscription.unsubscribe();
    }
  }

}
