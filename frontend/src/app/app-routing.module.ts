import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomePageComponent } from './components/home-page/home-page.component';
import { RegistrationComponent } from './components/registration/registration.component';
import { UserProfileComponent } from './components/user-profile/user-profile.component';
import { GraveyardsListComponent } from './components/graveyards-list/graveyards-list.component';



const routes: Routes = [
  {
    path: '',
    component: HomePageComponent
  },
  {
    path: 'register',
    component: RegistrationComponent
  },
  {
    path: 'profile',
    component: UserProfileComponent
  },
  {
    path: 'graveyards',
    component: GraveyardsListComponent
  },
  // {
  //   path: 'machines/edit/:machineNumber',
  //   component: MachineEditComponent
  // },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes),
  ],
  exports: [
    RouterModule,
  ]
})
export class AppRoutingModule { }
