import { Component, OnInit, Inject, OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';
import { GraveyardModel } from 'src/app/shared/models/graveyard.model';
import { GraveyardsService } from 'src/app/core/services/graveyards.service';
import { L10N_LOCALE, L10nLocale } from 'angular-l10n';
import { Router } from '@angular/router';

@Component({
  selector: 'app-graveyards-list',
  templateUrl: './graveyards-list.component.html',
  styleUrls: ['./graveyards-list.component.css']
})
export class GraveyardsListComponent implements OnInit, OnDestroy {
  subscription: Subscription = new Subscription();
  graveyards: GraveyardModel[];

  constructor(
    private graveyardService: GraveyardsService,
    private router: Router,
    @Inject(L10N_LOCALE) public locale: L10nLocale
  ) { }

  ngOnInit(): void {
    this.subscription.add(this.graveyardService.GetGraveyards()
      .subscribe(data => {
        this.graveyards = data;
      })
    );
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
  }
}
